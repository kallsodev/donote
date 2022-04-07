import 'package:easy_auth/easy_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyAuthRegisterProvider(
        onFailure: (error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(error),
              ),
            );
        },
        onSuccess: () => Navigator.pop(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RegisterEmailField(
              errorText: 'error',
            ),
            RegisterPasswordField(
              errorText: 'error',
            ),
            RegisterConfirmPasswordField(
              errorText: 'error',
            ),
            RegisterButton(
              child: Text('register'),
            ),
          ],
        ),
      ),
    );
  }
}
