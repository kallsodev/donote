import 'package:donote/blocs/local_notes_sync/local_notes_sync_cubit.dart';
import 'package:donote/blocs/notes/notes_bloc.dart';
import 'package:donote/injection.dart';
import 'package:donote/pages/home/home_view.dart';
import 'package:donote/pages/note_editor/note_editor_page.dart';
import 'package:donote/pages/note_editor/note_editor_view.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:donote/resources/strings.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          EasyUtils.push(context, const NoteEditorPage());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
      appBar: AppBar(
        title: Text(
          Strings.title,
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PopupMenuButton<String>(
                onSelected: (String result) {
                  switch (result) {
                    case 'logout':
                      EasyAuth.logout(context);
                      break;
                    case 'settings':
                      EasyUtils.push(
                          context,
                          const Scaffold(
                            body: Center(
                              child: Text("settings page"),
                            ),
                          ));
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'settings',
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
                color: Theme.of(context).colorScheme.secondary,
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30,
                ),
                enableFeedback: false,
                elevation: 0,
                offset: const Offset(-12, 40),
              )
              // child: GestureDetector(
              //   onTap: () {
              //
              //   },
              //   child: Icon(
              //     Icons.more_horiz,
              //     color: Theme.of(context).colorScheme.secondary,
              //     size: 30,
              //   ),
              // ),
              ),
        ],
      ),
      body: BlocBuilder<LocalNotesSyncCubit, LocalNotesSyncState>(
        builder: (context, state) {
          if (state.status == LocalNotesSyncStatus.upToDate) {
            return BlocProvider(
              create: (context) => NotesBloc(getIt<NotesRepository>())..add(const LoadNotes()),
              child: const SafeArea(
                child: HomeView(),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
