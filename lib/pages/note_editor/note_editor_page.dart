import 'package:donote/blocs/add_note/note_operations_cubit.dart';
import 'package:donote/injection.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/pages/note_editor/note_editor_view.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';

class NoteEditorPage extends StatelessWidget {
  final NoteModel? note;

  const NoteEditorPage({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return note != null
        ? BlocProviderPage(
            bloc: getIt<NoteOperationsCubit>()..setNote(note),
            child: NoteEditorView(
              note: note,
            ),
          )
        : BlocProviderPage(
            bloc: getIt<NoteOperationsCubit>(),
            child: const NoteEditorView(),
          );
  }
}
