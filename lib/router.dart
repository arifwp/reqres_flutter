import 'package:flutter/material.dart';
import 'package:reqres_flutter/auth/screens/login_screen.dart';
import 'package:reqres_flutter/auth/screens/register_screen.dart';
import 'package:reqres_flutter/home/screens/home_screen.dart';

Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(
              'Screen doesnt exists',
            ),
          ),
        ),
      );
  }
}
