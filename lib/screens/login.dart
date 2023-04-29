import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: () {
          context.go('/Landing');
        },
        child: const Text("Go to landing"),
      ),
    );
  }
}
