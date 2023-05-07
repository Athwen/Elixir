import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RedirectScreen extends StatelessWidget {
  RedirectScreen({super.key, required this.authCode});

  String? authCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Click on the button to redirect back to the app"),
              ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "https://elixir-6c470.web.app/landing?code=$authCode");
                },
                child: Text("Redirect"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
