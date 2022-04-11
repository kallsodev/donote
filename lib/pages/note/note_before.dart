import 'package:donote/blocs/add_note/note_operations_cubit.dart';
import 'package:donote/injection.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/pages/note/note_page.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';

class NoteBefore extends StatelessWidget {
  final NoteModel? note;

  const NoteBefore({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProviderPage(
        bloc: getIt<NoteOperationsCubit>()..setNote(note), child: NotePage(note: note,),
    );
  }
}
