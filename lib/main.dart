import 'package:donote/injection.dart';
import 'package:donote/pages/auth/login/login_page.dart';
import 'package:donote/pages/home/home_page.dart';
import 'package:donote/resources/custom_theme.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  EasyUtils.init(
    extraCalls: () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies();
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
    return const EasyAuthInit(
      child: EasyMaterialApp(
        debugShowCheckedModeBanner: false,
        home: EasyAuthLayer(
          unknown: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          unauthenticated: LoginPage(),
          authenticated: HomePage(),
        ),
      ),
    );
  }
}
