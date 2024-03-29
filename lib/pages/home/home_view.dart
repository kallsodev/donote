import 'package:donote/blocs/notes/notes_bloc.dart';
import 'package:donote/pages/home/widgets/note_card.dart';
import 'package:donote/pages/note_editor/note_editor_page.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: state.notes
                  .map((e) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: GestureDetector(
                          onTap: () {
                            EasyUtils.push(context, NoteEditorPage(note: e));
                          },
                          child: NoteCard(note: e),
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
