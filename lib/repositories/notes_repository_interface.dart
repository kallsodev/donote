import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/add_note_model.dart';
import 'package:donote/models/update_note_model.dart';

abstract class INotesRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes();

  Future<void> addNote({required AddNoteModel addNoteModel});

  Future<void> updateNote({required UpdateNoteModel updateNoteModel});

  Future<void> deleteNote({required DocumentReference documentReference});

}
