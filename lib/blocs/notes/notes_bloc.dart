import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'notes_event.dart';

part 'notes_state.dart';

@injectable
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository notesRepository;

  NotesBloc(this.notesRepository) : super(const NotesState.loading()) {
    on<LoadNotes>(_onLoadNotes);
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NotesState> emit) async {
    await emit.forEach<QuerySnapshot<Map<String, dynamic>>>(
      notesRepository.getNotes(),
      onData: (query) =>
          NotesState.loaded(
              query.docs.map((event) {
                NoteModel p = NoteModel.fromDocumentSnapshot(event);
                return p;
              }).toList(),
          ),
      onError: (e, __) {
        if(kDebugMode) {
          print(e);
        }
        return const NotesState.failed();
      },
    );
  }
}
