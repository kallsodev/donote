import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';

part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late NotesRepository notesRepository;

  SettingsBloc() : super(const SettingsState.loading()) {
    on<LoadSettings>(_onLoadSettings);
  }

  Future<void> _onLoadSettings(LoadSettings event, Emitter<SettingsState> emit) async {
    await emit.forEach<QuerySnapshot<Map<String, dynamic>>>(
      notesRepository.getNotes(),
      onData: (query) => SettingsState.loaded(
        query.docs.map((event) {
          NoteModel p = NoteModel.fromDocumentSnapshot(event);
          return p;
        }).toList(),
      ),
      onError: (e, __) {
        if (kDebugMode) {
          print(e);
        }
        return const SettingsState.failed();
      },
    );
  }
}
