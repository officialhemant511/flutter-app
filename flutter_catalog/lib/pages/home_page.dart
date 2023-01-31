import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "hello world";
  var dy = "monday"; // generic data type

  @override
  Widget build(BuildContext context) {
    final dummy_lst = List.generate(4, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("MY APP", textScaleFactor: 1.5),
      ),
      body: ListView.builder(
        // itemCount: CatalogModel.items.length,
        itemCount: dummy_lst.length,
        itemBuilder: (context, index) {
          return itemwidget(
            // item: CatalogModel.items[index],
            item: dummy_lst[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
