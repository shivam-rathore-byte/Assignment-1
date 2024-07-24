import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../models/book.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  List<Book> _searchResults = [];

  Future<void> _searchBooks(String query) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query'),
    );
    final data = json.decode(response.body);

    setState(() {
      _searchResults =
          (data['items'] as List).map((item) => Book.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Search for a book'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a book title';
                  }
                  return null;
                },
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _searchBooks(_titleController.text);
                }
              },
              child: Text('Search'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  Book book = _searchResults[index];
                  return ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.authors),
                    onTap: () {
                      bookProvider.addBook(book);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                title: Text("Book Added"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK")),
                                  TextButton(
                                      onPressed: () {
                                        //context.go('/');
                                        Navigator.pushNamed(context, '/');
                                      },
                                      child: Text("HOME"))
                                ],
                              ),
                            );
                          });
                      //Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
