import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/add_note_model.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/models/update_note_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

part 'note_operations_state.dart';

@injectable
class NoteOperationsCubit extends Cubit<NoteOperationsState> {
  NoteOperationsCubit(this._notesRepository)
      : super(const NoteOperationsState(status: NoteOperationsStatus.idle));

  final NotesRepository _notesRepository;

  Future<void> add({required AddNoteModel addNoteModel}) async {
    emit(state.copyWith(status: NoteOperationsStatus.loading));
    try {
      DocumentReference doc = await _notesRepository.addNote(addNoteModel: addNoteModel);
      emit(state.copyWith(status: NoteOperationsStatus.success, documentReference: doc));
      emit(state.copyWith(
        status: NoteOperationsStatus.idle,
      ));
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
      emit(state.copyWith(status: NoteOperationsStatus.failed, errorMessage: e.toString()));
    }
  }

  Future<void> update({required UpdateNoteModel updateNoteModel}) async {
    if (state.documentReference == null) {
      add(
          addNoteModel: AddNoteModel(
              title: updateNoteModel.title,
              data: updateNoteModel.data,
              color: updateNoteModel.color,
              stringData: updateNoteModel.stringData,
              hidden: updateNoteModel.hidden));
    } else {
      emit(state.copyWith(status: NoteOperationsStatus.loading));
      try {
        await _notesRepository.updateNote(
            updateNoteModel: updateNoteModel, documentReference: state.documentReference!);
        emit(state.copyWith(
          status: NoteOperationsStatus.success,
        ));
        emit(state.copyWith(
          status: NoteOperationsStatus.idle,
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
      emit(state.copyWith(status: NoteOperationsStatus.success, documentReference: noteModel.documentReference));
    }
  }
}
