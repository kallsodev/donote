import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class NoteOperationModel {
  final String title;
  final String data;
  final Color? color;
  final String stringData;
  final bool hidden;

  const NoteOperationModel(
      {required this.title,
      required this.data,
      required this.stringData,
      required this.hidden,
      this.color});

  Map<String, dynamic> toUpdateJson() => {
        'title': title,
        'data': data,
        'color': color?.value,
        'stringData': stringData,
        'lastModifiedAt': Timestamp.fromDate(DateTime.now()),
        'hidden': hidden,
      };

  Map<String, dynamic> toCreateJson() => {
    'title': title,
    'data': data,
    'color': color?.value,
    'stringData': stringData,
    'createdAt': Timestamp.fromDate(DateTime.now()),
    'lastModifiedAt': Timestamp.fromDate(DateTime.now()),
    'hidden': hidden,
  };
}
