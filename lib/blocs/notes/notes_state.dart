part of 'notes_bloc.dart';

enum NotesStatus { loading, loaded, failed }

class NotesState extends Equatable {
  const NotesState._({
    required this.status,
    this.error = "",
    this.notes = const []
  });

  const NotesState.loaded(List<NoteModel> notes)
      : this._(status: NotesStatus.loaded, notes: notes);

  const NotesState.loading() : this._(status: NotesStatus.loading);

  const NotesState.failed()
      : this._(status: NotesStatus.failed, error: "Failed to load notes");

  final NotesStatus status;
  final List<NoteModel> notes;
  final String error;

  @override
  List<Object> get props => [status, notes];

  @override
  String toString() {
    return "NotesState $status";
  }
}
