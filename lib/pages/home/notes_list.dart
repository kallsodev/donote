import 'package:donote/blocs/notes/notes_bloc.dart';
import 'package:donote/pages/note/note_page.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        switch (state.status) {
          case NotesStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case NotesStatus.loaded:
            return ListView(
              children: state.notes
                  .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    EasyUtils.push(context, NotePage(note: e));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.title),
                    ),
                  ),
                ),
              ))
                  .toList(),
            );
          case NotesStatus.failed:
            return const Center(
              child: Text("something went wrong."),
            );
        }
      },
    );
  }
}
