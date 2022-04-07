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
            LoginEmailField(
              errorText: 'error',
            ),
            LoginPasswordField(
              errorText: 'error',
            ),
            LoginButton(
              child: Text('login'),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              ),
              child: Text('go to register'),
            ),
          ],
        ),
      ),
    );
  }
}
