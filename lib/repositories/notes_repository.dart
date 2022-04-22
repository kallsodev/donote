import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/models/note_operation_model.dart';
import 'package:donote/repositories/notes_repository_interface.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class NotesRepository implements INotesRepository {
  @override
  Future<DocumentReference> createNote({required NoteOperationModel noteOperationModel}) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(EasyAuth.currentUserId)
        .collection('notes')
        .add(noteOperationModel.toCreateJson());
  }

  @override
  Future<void> deleteNote({required DocumentReference documentReference}) async {
    await documentReference.delete();
  }

  @override
  Future<void> updateNote({required NoteOperationModel noteOperationModel, required DocumentReference documentReference}) async {
    await documentReference.update(noteOperationModel.toUpdateJson());
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes() {
    return FirebaseFirestore.instance.collection('users').doc(EasyAuth.currentUserId).collection('notes').orderBy('lastModifiedAt', descending: true).snapshots();
  }
}
