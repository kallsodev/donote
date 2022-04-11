part of 'note_operations_cubit.dart';

enum NoteOperationsStatus { idle, loading, success, failed }

class NoteOperationsState extends Equatable {
  const NoteOperationsState({
    this.errorMessage,
    this.documentReference,
    required this.status,
  });

  final String? errorMessage;
  final NoteOperationsStatus status;
  final DocumentReference? documentReference;

  @override
  List<Object> get props =>
      [status, documentReference != null ? documentReference!.id : '', errorMessage ?? ""];

  NoteOperationsState copyWith({
    required NoteOperationsStatus status,
    DocumentReference? documentReference,
    String? errorMessage,
  }) {
    return NoteOperationsState(
      errorMessage: errorMessage ?? this.errorMessage,
      documentReference: documentReference ?? this.documentReference,
      status: status,
    );
  }
}
