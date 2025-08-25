part of 'notes_bloc.dart';

abstract class NotesEvent{
  const NotesEvent();
}

class LoadNotes extends NotesEvent {

  const LoadNotes();

}

class ChangeLockedVisibility extends NotesEvent {

  const ChangeLockedVisibility();
}
