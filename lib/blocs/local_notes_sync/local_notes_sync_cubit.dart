import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/local_note_model.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/repositories/local_notes_repository.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'local_notes_sync_state.dart';

@singleton
class LocalNotesSyncCubit extends Cubit<LocalNotesSyncState> {
  LocalNotesSyncCubit({required this.notesRepository, required this.localNotesRepository})
      : super(const LocalNotesSyncState(status: LocalNotesSyncStatus.unsyncedChanges));

  final NotesRepository notesRepository;
  final LocalNotesRepository localNotesRepository;

  Future<void> syncLocalData() async {
    if (localNotesRepository.getNotes().isNotEmpty) {
      print(
          "${localNotesRepository.getNotes().length.toString()} notes in the local db, sync incoming");
      for (var noteId in localNotesRepository.getNotes()) {
        LocalNoteModel localNoteModel = localNotesRepository.getNote(id: noteId);
        try {
          print("${localNoteModel.docId} is being sent");
          await notesRepository.updateNote(localNoteModel: localNoteModel);
          localNotesRepository.deleteNote(id: noteId);
          print("${localNoteModel.docId} done");
        } on FirebaseException catch (e) {
          print(e);
        } catch (e) {
          print(e);
        }
      }
    }
    emit(state.copyWith(
      status: LocalNotesSyncStatus.upToDate,
    ));
  }
}
