import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reqres_flutter/constants/error_handling.dart';
import 'package:reqres_flutter/constants/global_variable.dart';
import 'package:reqres_flutter/constants/utils.dart';
import 'package:reqres_flutter/models/user.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<User>> fetchAllUsers(BuildContext context) async {
    List<User> userList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/users'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body)['data'].length; i++) {
            userList.add(
              User.fromJson(
                jsonDecode(res.body)['data'][i],
              ),
            );
          }
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
    return userList;
  }
}
