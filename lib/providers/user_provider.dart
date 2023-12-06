import 'package:flutter/material.dart';
import 'package:reqres_flutter/models/user.dart';

class UserProvider extends ChangeNotifier {
  final User _user = User(
    id: 0,
    email: '',
    firstName: '',
    lastName: '',
    avatar: '',
  );

  User get user => _user;
}
