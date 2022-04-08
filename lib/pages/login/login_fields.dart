import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginFields extends StatelessWidget {
  const LoginFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyAuthLoginProvider(
      onFailure: (error) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(error),
            ),
          );
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                HSpace(MediaQuery.of(context).size.height * 0.05),
                const LoginEmailField(
                  errorText: 'error',
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                HSpace(MediaQuery.of(context).size.height * 0.04),
                const LoginPasswordField(
                  errorText: 'error',
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                HSpace(MediaQuery.of(context).size.height * 0.06),
                LoginButton(
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                HSpace(MediaQuery.of(context).size.height * 0.04),
              ],
            ),
            Column(
              children: [
                GoogleLoginButton(
                  child: SvgPicture.asset(
                    'assets/google_icon.svg',
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "don't have an account? Register",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}