import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  String? code;
  Landing({super.key, required this.code});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Text(widget.code!),
      ),
    );
  }
}
