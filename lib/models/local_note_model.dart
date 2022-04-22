import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'local_note_model.g.dart';

@HiveType(typeId: 0)
class LocalNoteModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime lastModifiedAt;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String data;
  @HiveField(4)
  final Color? color;
  @HiveField(5)
  final String stringData;
  @HiveField(6)
  final bool hidden;

  LocalNoteModel({
    required this.id,
    required this.lastModifiedAt,
    required this.title,
    required this.data,
    required this.stringData,
    required this.hidden,
    this.color,
  });

  @override
  List<Object> get props => [];
}
