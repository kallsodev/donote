import 'package:donote/blocs/notes/notes_bloc.dart';
import 'package:donote/injection.dart';
import 'package:donote/pages/home/notes_list.dart';
import 'package:donote/pages/note/note_page.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProviderPage(
        bloc: NotesBloc(getIt<NotesRepository>())..add(const LoadNotes()),
        child: SafeArea(
          child: Column(
            children: const [
              Expanded(
                child: NotesList(),
              ),
              LogoutButton(
                child: Text("LOGOUT"),
              ),
            ],
          ),
        ));
  }
}
