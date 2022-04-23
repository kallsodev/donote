import 'package:donote/blocs/local_notes_sync/local_notes_sync_cubit.dart';
import 'package:donote/blocs/note_sync/note_sync_cubit.dart';
import 'package:donote/injection.dart';
import 'package:donote/pages/auth/login/login_page.dart';
import 'package:donote/pages/home/home_page.dart';
import 'package:donote/repositories/local_notes_repository.dart';
import 'package:donote/resources/custom_theme.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  EasyUtils.init(
    extraCalls: () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies();
      await Hive.initFlutter();
      await getIt<LocalNotesRepository>().init();
      await EasyAuth.initializeFirebase();
    },
    appThemes: const CustomTheme(),
    child: const InitLayer(),
  );
}

class InitLayer extends StatelessWidget {
  const InitLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyAuthInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<NoteSyncCubit>(),
            lazy: false,
          ),
        ],
        child: EasyMaterialApp(
          debugShowCheckedModeBanner: false,
          home: EasyAuthLayer(
            unknown: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            unauthenticated: const LoginPage(),
            authenticated: BlocProvider(
              create: (context) => getIt<LocalNotesSyncCubit>(),
              child: const HomePage(),
            ),
          ),
        ),
      ),
    );
  }
}
