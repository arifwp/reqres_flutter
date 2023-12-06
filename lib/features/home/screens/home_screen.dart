import 'package:flutter/material.dart';
import 'package:reqres_flutter/features/auth/screens/login_screen.dart';
import 'package:reqres_flutter/features/create/screens/add_user.dart';
import 'package:reqres_flutter/features/detail/screens/detail_screen.dart';
import 'package:reqres_flutter/features/home/service/home_service.dart';
import 'package:reqres_flutter/models/user.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User>? user;
  final HomeService homeService = HomeService();
  final Random random = Random();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    fetchAllUsers();
  }

  fetchAllUsers() async {
    user = await homeService.fetchAllUsers(context);
    setState(() {});
  }

  void navigateToAddUser() {
    Navigator.pushNamed(context, AddUser.routeName);
  }

  void navigateToDetailScreen(BuildContext context, id) {
    Navigator.pushNamed(
      context,
      DetailScreen.routeName,
      arguments: id,
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReqRes.in'),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: user?.length ?? 0,
        itemBuilder: (context, index) {
          final userData = user![index];
          final randomNumber = random.nextInt(100000000) + 10;
          final initNumber = random.nextInt(1000) + 20;
          return GestureDetector(
            onTap: () => navigateToDetailScreen(context, userData.id),
            child: ListTile(
              title: Text(userData.firstName!),
              subtitle: Text('($initNumber) $randomNumber'),
              leading: CircleAvatar(
                child: Text(userData.firstName![0]),
              ),
              trailing: const Icon(Icons.star_outline_outlined),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: navigateToAddUser,
        tooltip: 'Add User',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
