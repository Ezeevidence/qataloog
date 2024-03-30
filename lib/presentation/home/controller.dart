import 'package:flutter/material.dart';
import 'package:qataloog/data/book/book_repo.dart';

class BooksProvider with ChangeNotifier {
  Future fetchBooks() async {
    final response = await BookRepo().fetchBooks();
    print(response);
    return response;
  }
}
