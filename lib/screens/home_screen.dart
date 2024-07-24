import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../models/book.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    num x = BookProvider.count;
    //print(x);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourite Books                       Count: $x'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add-book');
        },
        //onPressed: () => context.go('/add-book'),
        label: Text("Add Book"),
      ),
      body: ListView.builder(
        itemCount: bookProvider.books.length,
        itemBuilder: (context, index) {
          Book book = bookProvider.books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.authors),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                bookProvider.removeBook(book);
              },
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/book-details',
                arguments: book,
              );
              // context.go(
              //   '/book-details',
              //   extra: book,
              // );
            },
          );
        },
      ),
    );
  }
}
