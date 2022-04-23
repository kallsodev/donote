// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalNoteModelAdapter extends TypeAdapter<LocalNoteModel> {
  @override
  final int typeId = 0;

  @override
  LocalNoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalNoteModel(
      lastModifiedAt: fields[0] as DateTime,
      title: fields[1] as String,
      data: fields[2] as String,
      stringData: fields[4] as String,
      hidden: fields[5] as bool,
      docId: fields[6] as String,
      color: fields[3] as Color?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalNoteModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.lastModifiedAt)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.stringData)
      ..writeByte(5)
      ..write(obj.hidden)
      ..writeByte(6)
      ..write(obj.docId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalNoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
