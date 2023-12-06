import 'package:flutter/material.dart';
import 'package:reqres_flutter/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    email: '',
    password: '',
    first_name: '',
    last_name: '',
    avatar: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
