// import 'package:flutter/material.dart';
// import 'package:instagram_clone/resouces/auth_method.dart';

// import '../models/user.dart';

// class UserProvider with ChangeNotifier {
//   User? _user;
//   final AuthMethods _authMethods = AuthMethods();
//   User get getUser => _user!;

//   Future<void> refreshUser() async {
//     User user = await _authMethods.getUserDetails();
//     _user = user;
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';
import 'package:instagram_clone/resouces/auth_method.dart';

import '../models/user.dart';

// // class UserProvider with ChangeNotifier {
// //   User? _user;
// //   final AuthMethods _authMethods = AuthMethods();

// //   User? get getUser => _user; // Use the null-aware operator here

// class UserProvider with ChangeNotifier {
//   User? _user;
//   final AuthMethods _authMethods = AuthMethods();
//    User get getUser => _user!;
//   Future<void> refreshUser() async {
//     User user = await _authMethods.getUserDetails();
//     _user = user;
//     notifyListeners();
//   }
// }

import 'package:flutter/widgets.dart';


class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
