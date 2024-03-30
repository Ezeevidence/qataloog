import 'dart:async';

import 'package:qataloog/core/utils/api.dart';
import 'package:qataloog/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/exceptions.dart';

class AuthRepo {
  Api api = Api();

  Future userLogin(String email, String password) async {
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      final body = {
        "email": email,
        "password": password,
      };
      final response = await api.postData("login", body, headers);
      var data = api.processResponse(response);
      final statusCode = response.statusCode;

      String? message = data['message'];
      String? token = data['data']['token']['access_token'];
      print(token);
      if (statusCode == 200 || statusCode == 201) {
        final userJson = data['data']['user'];

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("TOKEN", token!);
        print(userJson['id']);
        print(userJson['name']);
        final user = UserModel.fromJson(userJson);

        return user;
      } else {
        return message;
      }
    } on UnAuthorizedException catch (_) {
      return "Unauthorized";
    } catch (error) {
      print(error);
      return ExceptionHandlers().getExceptionString(error);
    }
  }
}
