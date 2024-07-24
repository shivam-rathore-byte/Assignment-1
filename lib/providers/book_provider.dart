import 'package:flutter/material.dart';
import '../models/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  static num count = 0;
  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    count++;
    //print(count);
    notifyListeners();
  }

  void removeBook(Book book) {
    _books.remove(book);

    count--;
    // print(count);
    notifyListeners();
  }
}
