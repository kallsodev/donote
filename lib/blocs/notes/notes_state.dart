part of 'notes_bloc.dart';

enum NotesStatus { loading, loaded, failed }


class NotesState {
  final NotesStatus status;
  final List<NoteModel> notes;
  final String error;
  final bool shouldShowLockedNotes;

  const NotesState({
    this.status = NotesStatus.loading,
    this.error = "",
    this.notes = const [],
    this.shouldShowLockedNotes = true,
  });

  NotesState copyWith({
   NotesStatus? status,
    List<NoteModel>? notes,
    String? error,
    bool? shouldShowLockedNotes,
  }) =>
      NotesState(
        status: status ?? this.status,
        notes: notes ?? this.notes,
        error: error ?? this.error,
        shouldShowLockedNotes: shouldShowLockedNotes ?? this.shouldShowLockedNotes,
      );


  @override
  String toString() {
    return "NotesState - ${notes.length}";
  }
}

