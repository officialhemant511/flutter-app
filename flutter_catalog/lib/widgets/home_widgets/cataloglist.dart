import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalogimage.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        // final catalog = CatalogModel.items![index];
        return InkWell(
            // we use inkwell to use a functiion of ontap
            onTap: (() => Navigator.push(
                // use to navigate another page
                (context),
                MaterialPageRoute(
                    builder: (context) => homeDetailsPage(catalog: catalog)))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        //same as a container we have to rape
        child: Row(
      children: [
        // here we use hero weidget to use or put animations ->
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.color(context.theme.errorColor).make(),
            catalog.desc.text.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.shadowColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to Cart".text.make())
              ],
            ).pOnly(right: 8.0) //padding
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
