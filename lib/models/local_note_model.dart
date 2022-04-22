import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'local_note_model.g.dart';

@HiveType(typeId: 0)
class LocalNoteModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final DateTime lastModifiedAt;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String data;
  @HiveField(3)
  final Color? color;
  @HiveField(4)
  final String stringData;
  @HiveField(5)
  final bool hidden;
  @HiveField(6)
  final DocumentReference documentReference;

  LocalNoteModel({
    required this.lastModifiedAt,
    required this.title,
    required this.data,
    required this.stringData,
    required this.hidden,
    required this.documentReference,
    this.color,
  });

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

  @override
  List<Object> get props =>
      [title, data, color ?? "", stringData, hidden, lastModifiedAt, documentReference.id];
}
