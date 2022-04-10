import 'package:donote/models/add_note_model.dart';
import 'package:donote/models/update_note_model.dart';

abstract class NotesRepository {
  Future<void> addNote({required AddNoteModel addNoteModel});

  Future<void> updateNote({required UpdateNoteModel updateNoteModel});
}
