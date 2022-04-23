part of 'local_notes_sync_cubit.dart';

enum LocalNotesSyncStatus { idle, unsyncedChanges, upToDate, failed }

class LocalNotesSyncState extends Equatable {
  const LocalNotesSyncState(
      {this.errorMessage,
      this.documentReference,
      required this.status,
      required this.toSyncDocuments});

  final String? errorMessage;
  final LocalNotesSyncStatus status;
  final DocumentReference? documentReference;
  final List<String> toSyncDocuments;

  @override
  List<Object> get props => [
        status,
        documentReference != null ? documentReference!.id : '',
        errorMessage ?? "",
        toSyncDocuments
      ];

  LocalNotesSyncState copyWith({
    required LocalNotesSyncStatus status,
    DocumentReference? documentReference,
    List<String>? toSyncDocuments,
    String? errorMessage,
    String? changedDocument,
  }) {
    return LocalNotesSyncState(
      errorMessage: errorMessage ?? this.errorMessage,
      toSyncDocuments: [
        ...toSyncDocuments ?? this.toSyncDocuments,
        if (changedDocument != null) ...[changedDocument]
      ],
      documentReference: documentReference ?? this.documentReference,
      status: status,
    );
  }
}
