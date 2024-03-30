import 'package:flutter/material.dart';
import 'package:qataloog/core/utils/route_manager.dart';
import 'package:qataloog/data/auth/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/exceptions.dart';
import '../../domain/models/user_model.dart';
import '../nav_screen/nav_screen.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated
}

class AuthenticationProvider with ChangeNotifier {
  String? authToken;
  String? walletBalance;
  UserModel? userModel;
  AuthStatus status = AuthStatus.uninitialized;
  AuthRepo authRepo = AuthRepo();

  // public variables
  final formKey = GlobalKey<FormState>();

  AuthenticationProvider.initialize() {
    _initialize();
  }

  _initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("TOKEN");

    if (token == null) {
      status = AuthStatus.unauthenticated;
    } else {
      status = AuthStatus.authenticated;
    }
    notifyListeners();
  }

  Future userLogin(String email, String password, BuildContext context) async {
    try {
      final authResponse =
          await authRepo.userLogin(email, password).then((value) {
        print(value);
        if (value is UserModel) {
          userModel = value;
          status = AuthStatus.authenticated;

          notifyListeners();
          changeRouteRemove(context, NavigationScreen());
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
        }
      });
    } catch (error) {
      throw ExceptionHandlers().getExceptionString(error);
    }
  }
}
