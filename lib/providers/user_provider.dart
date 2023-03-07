import 'package:flutter/material.dart';

class UserData {
  UserData({required this.userId, required this.userName});

  final String userId;
  final String userName;
}

class UserModel extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  set userData(UserData? value) {
    if (value != _userData) {
      _userData = value;
      notifyListeners();
    }
  }
}
