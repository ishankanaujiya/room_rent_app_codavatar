import 'package:flutter/material.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 100,
        color: Colors.cyan,
        child: Image(image: AssetImage("logInScreenPersonPicture.png"),fit: BoxFit.contain,),

      ),
    );
  }
}