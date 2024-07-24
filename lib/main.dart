// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_book_screen.dart';
import 'screens/book_details_screen.dart';
import 'providers/book_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return HomeScreen();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'add-book',
//           builder: (BuildContext context, GoRouterState state) {
//             return AddBookScreen();
//           },
//         ),
//         GoRoute(
//           path: 'book-details',
//           builder: (BuildContext context, GoRouterState state) {
//             return BookDetailsScreen();
//           },
//         ),
//       ],
//     ),
//   ],
// );
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        title: 'Favourite Books App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // routerConfig: _router,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add-book': (context) => AddBookScreen(),
          '/book-details': (context) => BookDetailsScreen(),
        },
      ),
    );
  }
}
