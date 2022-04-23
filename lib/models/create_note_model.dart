import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_model.dart';
import 'package:equatable/equatable.dart';

class CreateNoteModel extends Equatable {
  final String title;
  final String data;
  final String stringData;
  final bool hidden;

  const CreateNoteModel({
    required this.title,
    required this.data,
    required this.stringData,
    required this.hidden,
  });

  @override
  List<Object?> get props => [title,data, stringData, hidden];


  Map<String, dynamic> toCreateJson() {
    DateTime date = DateTime.now();
    return {
    'title': title,
    'data': data,
    'stringData': stringData,
    'createdAt': Timestamp.fromDate(date),
    'lastModifiedAt': Timestamp.fromDate(date),
    'hidden': hidden,
  };
  }

  static emptyNote() {
    return const CreateNoteModel(title: "New note", data: "", stringData: "", hidden: false);
  }

  NoteModel toNoteModel(DocumentReference documentReference) {
    return NoteModel(title: title, data: data, stringData: stringData, hidden: hidden, createdAt: DateTime.now(), lastModifiedAt: DateTime.now(), documentReference: documentReference);
  }
}
