import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reqres_flutter/constants/error_handling.dart';
import 'package:reqres_flutter/constants/global_variable.dart';
import 'package:reqres_flutter/constants/utils.dart';
import 'package:reqres_flutter/models/user.dart';
import 'package:http/http.dart' as http;

class CreateService {
  void addNewUser({
    required BuildContext context,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      User user = User(
        email: email,
        firstName: firstName,
        lastName: lastName,
        avatar: "null",
      );

      http.Response res = await http.post(
        Uri.parse('$uri/users'),
        body: json.encode(user),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Users Added Successfully');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
