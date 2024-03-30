import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'exceptions.dart';

class Api {
  final String baseUrl = "http://3.8.121.163/api/v1/";
  //  get request,
  Future<http.Response> getData(String apiPath, [dynamic headers]) async {
    final mainPath = baseUrl + apiPath;
    final url = Uri.parse(mainPath);

    final response = await http
        .get(url, headers: headers ?? await _setHeaders())
        .timeout(const Duration(
          seconds: 40,
        ));
    return response;
  }

  // post request
  Future<http.Response> postData(String apiPath, dynamic body,
      [dynamic headers]) async {
    final mainPath = baseUrl + apiPath;
    final url = Uri.parse(mainPath);
    final response = await http
        .post(url,
            body: json.encode(body), headers: headers ?? await _setHeaders())
        .timeout(const Duration(
          seconds: 40,
        ));
    return response;
  }

  //  post file to server
  Future<http.Response> postFile(
    String apiPath,
    dynamic body, [
    Map<String, String>? headers,
  ]) async {
    final mainPath = baseUrl + apiPath;
    final url = Uri.parse(mainPath);
    final response = await http
        .post(
          url,
          body: json.encode(body),
          headers: headers ?? await _setHeaders(),
        )
        .timeout(const Duration(
          seconds: 40,
        ));
    return response;
  }

  // delete request
  Future<http.Response> deleteData(String apiPath,
      [dynamic body, dynamic headers]) async {
    final mainPath = baseUrl + apiPath;
    final url = Uri.parse(mainPath);
    final response = await http
        .delete(url,
            body: json.encode(body), headers: headers ?? await _setHeaders())
        .timeout(const Duration(
          seconds: 40,
        ));
    return response;
  }

  //  put request
  Future<http.Response> putData(
    String apiPath, [
    dynamic body,
    dynamic headers,
  ]) async {
    final mainPath = baseUrl + apiPath;
    final url = Uri.parse(mainPath);
    final response = await http
        .put(url,
            body: json.encode(body), headers: headers ?? await _setHeaders())
        .timeout(const Duration(
          seconds: 40,
        ));
    return response;
  }

  Future<Map<String, String>> _setHeaders() async => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${await getToken()} '
      };

  Future<String> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('TOKEN');
    debugPrint('The token is $token');
    print(token);
    return token ?? '';
  }

  Map<String, dynamic> processResponse(http.Response response) {
    var data = json.decode(response.body);

    switch (response.statusCode) {
      case 200:
        return data;
      case 201:
        return data;
      case 400:
        throw BadRequestException(message: data['message']);
      case 422:
        throw BadRequestException(message: data['message']);
      case 401:
        throw UnAuthorizedException(message: data['message']);
      case 402:
        throw UnAuthorizedException(
            message: "Not Authorized to perform this action");
      case 404:
        throw NotFoundException(message: "Request Not Found");
      case 500:
      default:
        throw BadRequestException(message: "Something went wrong. Try again");
    }
    return data;
  }
}
