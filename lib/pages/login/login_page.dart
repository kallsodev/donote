import 'package:donote/pages/register/register_page.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyAuthLoginProvider(
        onFailure: (error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(error),
              ),
            );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginEmailField(
              errorText: 'error',
            ),
            const LoginPasswordField(
              errorText: 'error',
            ),
            const LoginButton(
              child: Text('login'),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              ),
              child: const Text('go to register'),
            ),
          ],
        ),
      ),
    );
  }
}
