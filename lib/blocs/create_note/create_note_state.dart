part of 'create_note_cubit.dart';

enum CreateNoteStatus { idle, loading, success, failed }

class CreateNoteState extends Equatable {
  const CreateNoteState({
    this.errorMessage,
    this.documentReference,
    required this.status,
  });

  final String? errorMessage;
  final CreateNoteStatus status;
  final DocumentReference? documentReference;

  @override
  List<Object> get props =>
      [status, documentReference != null ? documentReference!.id : '', errorMessage ?? ""];

  CreateNoteState copyWith({
    required CreateNoteStatus status,
    DocumentReference? documentReference,
    String? errorMessage,
  }) {
    return CreateNoteState(
      errorMessage: errorMessage ?? this.errorMessage,
      documentReference: documentReference ?? this.documentReference,
      status: status,
    );
  }
}
