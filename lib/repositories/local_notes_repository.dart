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

  void putNote({required id, required LocalNoteModel note}) {
    _notes.put(id, note);
  }

  void deleteNote({required id}) {
    _notes.delete(id);
  }

  LocalNoteModel getNote({required id}) {
    return _notes.get(id)!;
  }
}
