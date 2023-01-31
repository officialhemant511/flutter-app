import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "hello world";

  var dy = "monday";
  // generic data type

  @override
  void initState() {
    // method to do initial state like here we put some product(items)
    // TODO: implement initState
    super.initState();
    loadData();
  }

  // load data is a user defined function
  loadData() async {
    // this is now we put json file in flutter
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // here catalogjson will return a string formate output...
    // print(catalogJson);// to check weather it will give correct output or not...
    final decodedData = jsonDecode(catalogJson);
    //print(decodeData);// do hot restart for check
    //gives a map which is dynamic while decoding it will change string(catalogson) to map(decodedata)
    //vice versa in jsonEncode();--> map to string in encoded form
    var productsData = decodedData["products"];
    // print(productsData);// check weather rather we get a productdata(item data) or not...
    
  }

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
