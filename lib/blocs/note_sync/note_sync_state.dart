part of 'note_sync_cubit.dart';

enum NoteSyncStatus { idle, unsyncedChanges, upToDate, failed }

class NoteSyncState extends Equatable {
  const NoteSyncState(
      {this.errorMessage,
      this.documentReference,
      required this.status,
      required this.toSyncDocuments});

  final String? errorMessage;
  final NoteSyncStatus status;
  final DocumentReference? documentReference;
  final Set<String> toSyncDocuments;

  @override
  List<Object> get props => [
        status,
        documentReference != null ? documentReference!.id : '',
        errorMessage ?? "",
        toSyncDocuments
      ];

  NoteSyncState copyWith({
    required NoteSyncStatus status,
    DocumentReference? documentReference,
    Set<String>? toSyncDocuments,
    String? errorMessage,
    String? changedDocument,
  }) {
    return NoteSyncState(
      errorMessage: errorMessage ?? this.errorMessage,
      toSyncDocuments: <String>{
        ...toSyncDocuments ?? this.toSyncDocuments,
        if (changedDocument != null) ...[changedDocument]
      },
      documentReference: documentReference ?? this.documentReference,
      status: status,
    );
  }
}
