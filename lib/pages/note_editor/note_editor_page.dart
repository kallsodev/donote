import 'package:donote/blocs/create_note/create_note_cubit.dart';
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
            bloc: getIt<CreateNoteCubit>()..setNote(note),
            child: NoteEditorView(
              note: note,
            ),
          )
        : BlocProviderPage(
            bloc: getIt<CreateNoteCubit>()..createNew(),
            child: const NoteEditorView(),
          );
  }
}
