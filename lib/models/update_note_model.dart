import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateNoteModel {
  final String title;
  final String data;
  final Color? color;
  final String stringData;
  final bool hidden;

  const UpdateNoteModel(
      {required this.title,
      required this.data,
      required this.stringData,
      required this.hidden,
      this.color});

  Map<String, dynamic> toJson() => {
        'title': title,
        'data': data,
        'color': color?.value,
        'stringData': stringData,
        'lastModifiedAt': Timestamp.fromDate(DateTime.now()),
        'hidden': hidden,
      };
}
