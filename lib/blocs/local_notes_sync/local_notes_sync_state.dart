part of 'local_notes_sync_cubit.dart';

enum LocalNotesSyncStatus { idle, unsyncedChanges, upToDate, failed }

class LocalNotesSyncState extends Equatable {
  const LocalNotesSyncState({
    this.errorMessage,
    required this.status,
  });

  final String? errorMessage;
  final LocalNotesSyncStatus status;

  @override
  List<Object> get props => [
        status,
        errorMessage ?? "",
      ];

  LocalNotesSyncState copyWith({
    required LocalNotesSyncStatus status,
    String? errorMessage,
  }) {
    return LocalNotesSyncState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status,
    );
  }
}
