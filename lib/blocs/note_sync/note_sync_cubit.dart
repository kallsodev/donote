import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/local_note_model.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/repositories/local_notes_repository.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'note_sync_state.dart';

@singleton
class NoteSyncCubit extends Cubit<NoteSyncState> {
  NoteSyncCubit({required this.notesRepository, required this.localNotesRepository})
      : super(const NoteSyncState(status: NoteSyncStatus.upToDate, toSyncDocuments: {}));

  final NotesRepository notesRepository;
  final LocalNotesRepository localNotesRepository;

  Timer? _timer;

  Future<void> _onSync() async {
    if (state.toSyncDocuments.isEmpty) {
      return;
    }
    for (String noteId in state.toSyncDocuments) {
      LocalNoteModel localNoteModel = localNotesRepository.getNote(id: noteId);
      try {
        await notesRepository.updateNote(localNoteModel: localNoteModel);
        localNotesRepository.deleteNote(id: noteId);
      } on FirebaseException catch (e) {
        print(e);
      } catch (e) {
        print(e);
      }
    }
    emit(state.copyWith(
      status: NoteSyncStatus.upToDate,
      toSyncDocuments: {},
    ));
  }

  void onChanged({required LocalNoteModel localNoteModel}) {
    emit(state.copyWith(
        status: NoteSyncStatus.unsyncedChanges,
        changedDocument: localNoteModel.docId));
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 5), _onSync);
    localNotesRepository.putNote(id: localNoteModel.docId, note: localNoteModel);
  }

  Future<void> forceSync({required LocalNoteModel localNoteModel}) async {
    try {
      await notesRepository.updateNote(localNoteModel: localNoteModel);
      localNotesRepository.deleteNote(id: localNoteModel.docId);
      Set<String> set = state.toSyncDocuments;
      set.remove(localNoteModel.docId);
      emit(state.copyWith(
        status: state.status,
        toSyncDocuments: set,
      ));
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
