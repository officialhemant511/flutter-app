import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      cardColor: Colors.black, 
      canvasColor: creamColor,
      errorColor: darkBluishColor,
      shadowColor: lightBluishColor,
      // buttonColor: darkBluishColor,
      // fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      )
      // primaryTextTheme: GoogleFonts.latoTextTheme()
      );
  static ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      errorColor: Colors.white,
      shadowColor: lightBluishColor,
      splashColor: Colors.white,
      // fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,

        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ));
//colors

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color.fromARGB(255, 19, 9, 69);
  static Color lightBluishColor = Vx.indigo500;
}
