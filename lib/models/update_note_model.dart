import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateNoteModel {
  final String title;
  final String data;
  final bool hidden;
  final DocumentReference documentReference;

  const UpdateNoteModel(
      {required this.title, required this.data, required this.hidden, required this.documentReference});

  Map<String, dynamic> toJson() => {
        'title': title,
        'data': data,
        'lastModifiedAt': Timestamp.fromDate(DateTime.now()),
        'hidden': hidden,
      };
}