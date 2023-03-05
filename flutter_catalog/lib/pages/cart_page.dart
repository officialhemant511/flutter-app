// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart"
              .text
              .color(context.theme.errorColor)
              .xl2
              .make()
              .pOnly(left: 110),
        ),
        body: Column(children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ]),
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          "\$9999".text.xl4.color(context.theme.shadowColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: context.canvasColor,
                        content: "Buying not supproted yet"
                            .text
                            .xl
                            .color(context.theme.cardColor)
                            .make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.lightBluishColor)),
                  child: "Buy".text.white.make())
              .w32(context)
        ]));
  }
}

class _cartList extends StatefulWidget {
  @override
  State<_cartList> createState() => __cartListState();
}

class __cartListState extends State<_cartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              title: "Item 1".text.make(),
            ));
  }
}
