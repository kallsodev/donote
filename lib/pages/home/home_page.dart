import 'package:easy_auth/easy_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            LogoutButton(
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
