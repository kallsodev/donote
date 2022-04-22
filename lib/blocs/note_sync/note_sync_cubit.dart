import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/models/note_operation_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'note_sync_state.dart';

@singleton
class NoteSyncCubit extends Cubit<NoteSyncState> {
  NoteSyncCubit(this._notesRepository)
      : super(const NoteSyncState(status: NoteSyncStatus.upToDate, toSyncDocuments: []));

  final NotesRepository _notesRepository;

  Timer? _timer;


  void _onSync() {
    //TODO get data from local
    //

  }

  void onChanged({required DocumentReference documentReference, required NoteOperationModel noteOperationModel}) {
    emit(state.copyWith(status: NoteSyncStatus.unsyncedChanges, changedDocument: documentReference.id));
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 5), _onSync);
    //TODO ADD TO LOCAL SYNC
  }
}
