import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reqres_flutter/common/detail_box.dart';
import 'package:reqres_flutter/constants/global_variable.dart';
import 'package:reqres_flutter/features/detail/services/detail_service.dart';
import 'package:reqres_flutter/models/user.dart';

class DetailScreen extends StatefulWidget {
  static const String routeName = '/detail-screen';
  final int idUser;
  const DetailScreen({super.key, required this.idUser});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailService detailService = DetailService();
  User user = User();
  final Random random = Random();
  int initNumber = 0;
  int randomNumber = 0;

  @override
  void initState() {
    super.initState();
    getSingleUser();

    initNumber = random.nextInt(1000) + 20;
    randomNumber = random.nextInt(100000000) + 10;
  }

  getSingleUser() async {
    user = await detailService.getSingleUser(context, widget.idUser.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: GlobalVariables.mainColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: GlobalVariables.mainColor,
                child: Column(
                  children: [
                    user.avatar != null
                        ? Container(
                            height: 200,
                            width: 200,
                            child: CircleAvatar(
                              backgroundColor: GlobalVariables.mainColor,
                              backgroundImage: NetworkImage(
                                user.avatar.toString(),
                              ),
                            ),
                          )
                        : const Icon(Icons.person),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      user.firstName.toString() +
                          ' ' +
                          user.lastName.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              DetailBox(
                icon: const Icon(Icons.phone),
                title: '($initNumber) $randomNumber',
                subtitle: 'dummy',
                iconEnd: const Icon(Icons.chat),
              ),
              DetailBox(
                icon: const Icon(Icons.email),
                title: user.email.toString(),
                subtitle: 'Email',
              ),
              const DetailBox(
                icon: Icon(Icons.share),
                title: 'github.com/arifwp',
                subtitle: 'Github',
              ),
            ],
          ),
        ));
  }
}
