import 'package:flutter/material.dart';
import 'package:reqres_flutter/features/auth/screens/login_screen.dart';
import 'package:reqres_flutter/features/auth/screens/register_screen.dart';
import 'package:reqres_flutter/features/create/screens/add_user.dart';
import 'package:reqres_flutter/features/detail/screens/detail_screen.dart';
import 'package:reqres_flutter/features/home/screens/home_screen.dart';

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
    case AddUser.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddUser(),
      );
    case DetailScreen.routeName:
      var id = routeSettings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => DetailScreen(idUser: id),
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
