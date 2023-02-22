import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:typed_data';

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
      theme: MyTheme.lightTheme(context),
      darkTheme:MyTheme.darkTheme(),
          

      initialRoute: MyRoutes.homeRoute,
      debugShowCheckedModeBanner:
          false, // it will remove the debug buttom from screen

      routes: {
        "/": (context) =>
            LoginPage(), // refer to home page but we already refer home page above itself
        // "/home": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        // "/login": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
