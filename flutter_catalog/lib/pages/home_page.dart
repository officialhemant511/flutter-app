import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "hello world";
  var dy = "monday"; // generic data type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY APP"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to My App $days $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
