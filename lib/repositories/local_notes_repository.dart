import 'package:donote/models/local_note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:injectable/injectable.dart';

@singleton
class LocalNotesRepository {
  late Box<LocalNoteModel> _notes;

  Future<void> init() async {
    Hive.registerAdapter(LocalNoteModelAdapter());
    _notes = await Hive.openBox<LocalNoteModel>('notes');
  }

  Future<void> putNote({required id, required LocalNoteModel note}) async {
    _notes.put(id, note);
  }

  Future<void> deleteNote({required id, required LocalNoteModel note}) async {
    _notes.delete(id);
  }
}
