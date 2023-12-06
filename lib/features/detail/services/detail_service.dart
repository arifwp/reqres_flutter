import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reqres_flutter/constants/error_handling.dart';
import 'package:reqres_flutter/constants/global_variable.dart';
import 'package:reqres_flutter/constants/utils.dart';
import 'package:reqres_flutter/models/user.dart';
import 'package:http/http.dart' as http;

class DetailService {
  Future<User> getSingleUser(BuildContext context, String id) async {
    User userData = User();
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/users/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          userData = User.fromJson(
            jsonDecode(res.body)['data'],
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return userData;
  }
}
