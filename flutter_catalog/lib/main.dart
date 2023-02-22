import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
// import 'package:google_fonts/google_fonts.dart';

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
