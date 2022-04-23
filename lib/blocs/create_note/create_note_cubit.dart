import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/create_note_model.dart';
import 'package:donote/models/local_note_model.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'create_note_state.dart';

@injectable
class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit(this._notesRepository)
      : super(const CreateNoteState(status: CreateNoteStatus.idle));

  final NotesRepository _notesRepository;

  Future<void> setNote(NoteModel? noteModel) async {
    if (noteModel != null) {
      emit(state.copyWith(
          status: CreateNoteStatus.success, note: noteModel));
    } else {
      try {
        CreateNoteModel createNoteModel = CreateNoteModel.emptyNote();
        DocumentReference doc =
            await _notesRepository.createNote(createNoteModel: createNoteModel);
        emit(state.copyWith(status: CreateNoteStatus.success, note: createNoteModel.toNoteModel(doc)));
      } on FirebaseException catch (e) {
        print(e);
      } catch (e) {
        print(e);
        emit(state.copyWith(status: CreateNoteStatus.failed, errorMessage: e.toString()));
      }
    }
  }
}
