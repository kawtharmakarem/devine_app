import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthButtonGroup(
  style: const AuthButtonStyle(
    width: 180,
    height: 50,
    borderColor: Colors.purple,
    borderWidth: 3.0,
    margin: EdgeInsets.only(bottom: 8.0),
  ),
  buttons: [
    GoogleAuthButton(onPressed: (){},),
    AppleAuthButton(onPressed: (){},),
    //....
  ]
);
  }
}

