import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(child: Text("LoginScreen"),)
      ),
    );
  }


}

