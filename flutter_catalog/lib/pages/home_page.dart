import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "hello world";
  var dy = "monday"; // generic data type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY APP", textScaleFactor: 1.5),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to My App $days $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
