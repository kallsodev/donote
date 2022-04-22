import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/create_note_model.dart';
import 'package:donote/models/local_note_model.dart';

abstract class INotesRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes();

  Future<DocumentReference> createNote({required CreateNoteModel createNoteModel});

  Future<void> updateNote({required LocalNoteModel localNoteModel});

  Future<void> deleteNote({required DocumentReference documentReference});

}
