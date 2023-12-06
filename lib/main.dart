import 'package:flutter/material.dart';
import 'package:reqres_flutter/auth/screens/login_screen.dart';
import 'package:reqres_flutter/auth/screens/register_screen.dart';
import 'package:reqres_flutter/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      debugShowCheckedModeBanner: false,
      title: 'reqres flutter',
      home: const LoginScreen(),
    );
  }
}
