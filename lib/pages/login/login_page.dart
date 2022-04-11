import 'package:donote/pages/login/login_fields.dart';
import 'package:donote/widgets/wave_container.dart';
import 'package:donote/pages/register/register_page.dart';
import 'package:donote/resources/strings.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              HSpace(MediaQuery.of(context).size.height * 0.25),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Hero(
                        tag: Strings.title,
                        child: FittedBox(
                          child: Text(
                            Strings.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: [
                      Hero(
                        tag: 'waves',
                        child: SizedBox(
                          height: constraints.maxHeight,
                          child: WaveContainer(maxWidth: MediaQuery.of(context).size.width),
                        ),
                      ),
                      const LoginFields(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
