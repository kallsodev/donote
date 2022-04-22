import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_operation_model.dart';

abstract class INotesRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes();

  Future<DocumentReference> createNote({required NoteOperationModel noteOperationModel});

  Future<void> updateNote({required NoteOperationModel noteOperationModel, required DocumentReference documentReference});

  Future<void> deleteNote({required DocumentReference documentReference});

}
