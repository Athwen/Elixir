import 'package:elixir/util/pkce.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../util/spotify-api/auth_code.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.5, -1.0),
            end: Alignment(0.5, 1),
            colors: [
              Color(0xFFFF7C7C),
              Color(0xFF3E8989),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Elixir", style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                // Launches url to get a user's spotify authorizaton code
                String url = genSpotifyAuthURL();
                launchUrlString(url, mode: LaunchMode.externalApplication);
              },
              child: const Text("Connect with Spotify"),
            ),
          ],
        ),
      ),
    );
  }
}
