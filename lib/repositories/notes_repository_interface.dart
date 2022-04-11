import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/add_note_model.dart';
import 'package:donote/models/update_note_model.dart';

abstract class INotesRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes();

  Future<DocumentReference> addNote({required AddNoteModel addNoteModel});

  Future<void> updateNote({required UpdateNoteModel updateNoteModel, required DocumentReference documentReference});

  Future<void> deleteNote({required DocumentReference documentReference});

}
