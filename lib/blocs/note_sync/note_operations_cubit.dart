import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/models/note_operation_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'note_operations_state.dart';

@singleton
class NoteSyncCubit extends Cubit<NoteOperationsState> {
  NoteSyncCubit(this._notesRepository)
      : super(const NoteOperationsState(status: NoteOperationsStatus.idle));

  final NotesRepository _notesRepository;

  Future<void> add({required NoteOperationModel noteOperationModel}) async {
    emit(state.copyWith(status: NoteOperationsStatus.loading));
    try {
      DocumentReference doc = await _notesRepository.createNote(noteOperationModel: noteOperationModel);
      emit(state.copyWith(status: NoteOperationsStatus.upToDate, documentReference: doc));
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
      emit(state.copyWith(status: NoteOperationsStatus.failed, errorMessage: e.toString()));
    }
  }

  Future<void> update({required NoteOperationModel noteOperationModel}) async {
    if (state.documentReference == null) {
      add(
          noteOperationModel: NoteOperationModel(
              title: noteOperationModel.title,
              data: noteOperationModel.data,
              color: noteOperationModel.color,
              stringData: noteOperationModel.stringData,
              hidden: noteOperationModel.hidden));
    } else {
      emit(state.copyWith(status: NoteOperationsStatus.loading));
      try {
        await _notesRepository.updateNote(
            noteOperationModel: noteOperationModel, documentReference: state.documentReference!);
        emit(state.copyWith(
          status: NoteOperationsStatus.upToDate,
        ));
      } on FirebaseException catch (e) {
        print(e);
      } catch (e) {
        print(e);
        emit(state.copyWith(status: NoteOperationsStatus.failed, errorMessage: e.toString()));
      }
    }
  }

  void setNote(NoteModel? noteModel) {
    if(noteModel != null) {
      emit(state.copyWith(status: NoteOperationsStatus.upToDate, documentReference: noteModel.documentReference));
    }
  }
}
