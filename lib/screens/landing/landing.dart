import 'package:elixir/util/responsive/responsive.dart';
import 'package:elixir/util/spotify-api/access_token.dart';
import 'package:elixir/util/spotify-api/spotify_app_config.dart';
import 'package:elixir/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Landing extends StatefulWidget {
  String? authCode;
  Landing({super.key, required this.authCode});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: percentHeight(context, 1),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF61BCD9),
                Color(0xFF212121),
              ],
              begin: Alignment(0.5, -1.0),
              end: Alignment(0.5, 0.5),
            ),
          ),
          child: FutureBuilder<Object>(
              future: getToken(widget.authCode!),
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? const Center(
                        child: SpinKitPouringHourGlassRefined(
                          color: Colors.indigo,
                        ),
                      )
                    : Column(
                        children: [
                          LandingCard(
                            title: "Your Profile",
                            width: percentHeight(context, 0.80),
                            child: Center(
                              child: Text(
                                SpotifyConfig.getUserToken(),
                              ),
                            ),
                          ),
                        ],
                      );
              }),
        ),
      ),
    );
  }
}
