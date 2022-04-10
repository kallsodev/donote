import 'package:cloud_firestore/cloud_firestore.dart';

class AddNoteModel {
  final String title;
  final String data;
  final bool hidden;

  AddNoteModel(
      {required this.title, required this.data, required this.hidden});

  Map<String, dynamic> toJson() => {
        'title': title,
        'data': data,
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'lastModifiedAt': Timestamp.fromDate(DateTime.now()),
        'hidden': hidden,
      };
}
