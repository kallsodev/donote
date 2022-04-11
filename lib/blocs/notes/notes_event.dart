part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();
}

class LoadNotes extends NotesEvent {

  const LoadNotes();

  @override
  List<Object?> get props => ['load'];
}
