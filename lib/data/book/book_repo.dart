import 'dart:async';
import 'dart:convert';

import 'package:qataloog/core/utils/api.dart';

import '../../core/utils/exceptions.dart';
import '../../domain/models/book_model.dart';

class BookRepo {
  Api api = Api();

  Future fetchBooks() async {
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${await api.getToken()}',
        'platform': "Qataloog",
        'language': "English",
      };

      final response =
          await api.getData("contentTypeBookListing/Books", headers);
      var result = json.decode(response.body);
      var data = result['data'];
      if (response.statusCode == 200 || response.statusCode == 201) {
        final books = data.map((e) => BookModel.fromJson(e)).toList();
        print(books);
        return books;
      }
    } catch (error) {
      print(error);

      return ExceptionHandlers().getExceptionString(error);
    }
  }
}
