import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;
    print('Thumbnail URL: ${book.thumbnail}');

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Image.network(book.thumbnail),
            SizedBox(height: 8),
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              book.authors,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}
