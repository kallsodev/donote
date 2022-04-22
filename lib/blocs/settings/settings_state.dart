part of 'settings_bloc.dart';

enum SettingsStatus { loading, loaded, failed }

class SettingsState extends Equatable {
  const SettingsState._({required this.status, this.error = "", this.notes = const []});

  const SettingsState.loaded(List<NoteModel> notes)
      : this._(status: SettingsStatus.loaded, notes: notes);

  const SettingsState.loading() : this._(status: SettingsStatus.loading);

  const SettingsState.failed()
      : this._(status: SettingsStatus.failed, error: "Failed to load notes");

  final SettingsStatus status;
  final List<NoteModel> notes;
  final String error;

  @override
  List<Object> get props => [status, notes];

  @override
  String toString() {
    return "SettingsStatus $status";
  }
}
