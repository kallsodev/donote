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

  List<LocalNoteModel> getNotes() {
    return _notes.values.toList();
  }

  void putNote({required String id, required LocalNoteModel note}) {
    _notes.put(id, note);
  }

  void deleteNote({required String id}) {
    _notes.delete(id);
  }

  void deleteAllNotes() {
    _notes.clear();
  }

  LocalNoteModel getNote({required String id}) {
    return _notes.get(id)!;
  }
}
