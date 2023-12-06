import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqres_flutter/features/auth/screens/login_screen.dart';
import 'package:reqres_flutter/features/home/screens/home_screen.dart';
import 'package:reqres_flutter/providers/user_provider.dart';
import 'package:reqres_flutter/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        title: 'reqres flutter',
        home: token == null ? const LoginScreen() : const HomeScreen(),
      ),
    ),
  );
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
