import 'package:elixir/screens/landing/landing.dart';
import 'package:elixir/screens/login/login.dart';
import 'package:elixir/screens/redirect.dart';
import 'package:elixir/util/spotify-api/spotify_app_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/landing',
      builder: (BuildContext context, GoRouterState state) {
        print("landing params: ${state.queryParameters}");
        return Landing(authCode: state.queryParameters['code']);
      },
    ),
    GoRoute(
      path: '/redirect',
      builder: (BuildContext context, GoRouterState state) {
        print(state.queryParameters);
        return RedirectScreen(authCode: state.queryParameters['code']);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: SpotifyConfig.setPrefInstance(),
        builder: (context, snapshot) {
          return MaterialApp.router(
            theme: ThemeData(
              textTheme: GoogleFonts.soraTextTheme(),
            ),
            routerConfig: _router,
          );
        });
  }
}
