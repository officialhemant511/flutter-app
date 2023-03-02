import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/widgets/themes.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/cataloglist.dart';
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
  // way to load json files into our app

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
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
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // now we dont want any dummy list we have our own data so we remove-->

    // final dummy_lst = List.generate(4, (index) => CatalogModel.items[0]);

    return Scaffold(
        backgroundColor: context.cardColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.lightBluishColor,
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white ,
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
// ***********************************************************
    // appBar: AppBar(
    //   title: Text("MY APP", textScaleFactor: 1.5),
    // ),
    // body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
    //       ? GridView.builder(
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               mainAxisSpacing: 16,
    //               crossAxisSpacing: 16),
    //           itemBuilder: (context, index) {
    //             final item = CatalogModel.items?[index];
    //             return Card(
    //                 // clipBehavior: Clip.antiAlias,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(20)),
    //                 child: GridTile(
    //                   // it is used to decorate and give styling our gird ...
    //                   header: Container(
    //                     child: Text(
    //                       item!.name,
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                     padding: const EdgeInsets.all(12),
    //                     decoration: BoxDecoration(
    //                       color: Colors.blue,
    //                     ),
    //                   ),
    //                   child: Image.network(item.image),
    //                   footer: Container(
    //                     child: Text(
    //                       item.price.toString(),
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                     padding: const EdgeInsets.all(12),
    //                     decoration: BoxDecoration(
    //                       color: Colors.blue,
    //                     ),
    //                   ),
    //                 ));
    //           },
    //           itemCount: CatalogModel.items!.length,
    //         )
    //       // ? ListView.builder(
    //       //     // itemCount: CatalogModel.items.length,
    //       //     itemCount: CatalogModel.items!.length,
    //       //     itemBuilder: (context, index) {
    //       //       return itemwidget(
    //       //         // item: CatalogModel.items[index],
    //       //         item: CatalogModel.items![index],
    //       //       );
    //       //     },
    //       //   )
    //       : Center(
    //           child: CircularProgressIndicator(),
    //         ),
    // ),
    // drawer: MyDrawer(),
    // );//scafold end
    // ***************************************************************
  }
}
