// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
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
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
        height: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          "/${_cart.totalprice}"
              .text
              .xl4
              .color(context.theme.shadowColor)
              .make(),
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
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing To show".text.xl2.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
