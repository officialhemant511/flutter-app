import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
// import 'dart:html';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    // for set state here we use vx listen
    VxState.watch(context, on: [AddMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog; // becaue of use of mutation

    // it will become false if our cart is empty -->
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogModel();

            // we use to set cart from catalog for using add and other function
            // _cart.catalog = _catalog;

            // _cart.add(catalog);

            AddMutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.shadowColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart
            ? Icon(Icons.done)
            : Icon(Icons.add_shopping_cart_rounded));
  }
}
