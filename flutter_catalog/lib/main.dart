import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.yellow),
      initialRoute: "/home",
      routes: {
        "/": (context) =>
            LoginPage(), // refer to home page but we already refer home page above itself
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
