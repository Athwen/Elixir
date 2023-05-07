import 'package:elixir/screens/landing.dart';
import 'package:elixir/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
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
        return Landing(authCode: state.queryParameters['code']);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      routerConfig: _router,
    );
  }
}
