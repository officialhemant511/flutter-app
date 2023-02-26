import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.xl2.make().pOnly(left: 110),
        ),
      ),
    );
  }
}
