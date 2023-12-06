import 'package:flutter/material.dart';
import 'package:reqres_flutter/home/service/home_service.dart';
import 'package:reqres_flutter/models/user.dart';
import 'dart:math';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReqRes.in'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: user?.length ?? 0,
        itemBuilder: (context, index) {
          final userData = user![index];
          final randomNumber = random.nextInt(100000000) + 10;
          final initNumber = random.nextInt(1000) + 20;
          return ListTile(
            title: Text(userData.firstName!),
            subtitle: Text('($initNumber) $randomNumber'),
            leading: CircleAvatar(
              child: Text(userData.firstName![0]),
            ),
            trailing: Icon(Icons.star_outline_outlined),
          );
        },
      ),
    );
  }
}
