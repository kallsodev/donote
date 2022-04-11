import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String title;
  final String data;
  final DateTime createdAt;
  final DateTime lastModifiedAt;
  final bool hidden;
  final DocumentReference documentReference;

  const NoteModel({
    required this.title,
    required this.data,
    required this.hidden,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.documentReference,
  });

  @override
  List<Object?> get props => [documentReference.id, title, data, lastModifiedAt];

  static fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return NoteModel(
        title: data['title'],
        data: data['data'],
        hidden: data['hidden'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
        lastModifiedAt: (data['lastModifiedAt'] as Timestamp).toDate(),
        documentReference: doc.reference);
  }
}
