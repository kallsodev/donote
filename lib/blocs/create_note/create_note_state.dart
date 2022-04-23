part of 'create_note_cubit.dart';

enum CreateNoteStatus { idle, loading, success, failed }

class CreateNoteState extends Equatable {
  const CreateNoteState({
    this.errorMessage,
    this.note,
    required this.status,
  });

  final String? errorMessage;
  final CreateNoteStatus status;
  final NoteModel? note;

  @override
  List<Object> get props =>
      [status, note != null ? note!.documentReference.id : '', errorMessage ?? ""];

  CreateNoteState copyWith({
    required CreateNoteStatus status,
    NoteModel? note,
    String? errorMessage,
  }) {
    return CreateNoteState(
      errorMessage: errorMessage ?? this.errorMessage,
      note: note ?? this.note,
      status: status,
    );
  }
}
