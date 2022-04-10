import 'package:donote/resources/strings.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RegisterFields extends StatelessWidget {
  const RegisterFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyAuthRegisterProvider(
      onFailure: (error) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(error, style: TextStyle(color: Colors.white),),
            ),
          );
      },
      onSuccess: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                HSpace(MediaQuery.of(context).size.height * 0.05),
                const RegisterEmailField(
                  height: 80,
                  errorText: Strings.errorInvalidEmail,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const RegisterPasswordField(
                  height: 80,
                  errorText: Strings.errorInvalidPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const RegisterConfirmPasswordField(
                  height: 80,
                  errorText: Strings.errorInvalidConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                  ),
                ),
                RegisterButton(
                  child: Text(
                    'Register',
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
                    Strings.googleIcon,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Already have an account? Login",
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