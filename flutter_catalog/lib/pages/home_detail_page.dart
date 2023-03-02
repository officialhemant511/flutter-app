import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class homeDetailsPage extends StatelessWidget {
  final Item catalog;

  const homeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: Text(catalog.name),
      ),
      backgroundColor: context.theme.canvasColor,
      // button bar for price and buy button
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.color(Colors.red).make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.shadowColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to Cart".text.xl.make())
                .wh(130, 50)
          ],
        ).p32(),
      ),

      body: SafeArea(
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.bold.xl4.color(context.accentColor).make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "Erat vero diam stet nonumy duo rebum et rebum est, voluptua dolor duo magna voluptua. Voluptua sit aliquyam invidunt et accusam diam at sed nonumy, diam sadipscing rebum est et clita, sea sea ea tempor et ipsum sit sanctus, dolor elitr sit diam dolor, at kasd lorem accusam lorem erat."
                      .text
                      .lineHeight(2)
                      .textStyle(context.captionStyle)
                      .make()
                      .p16()
                ],
              ).py64(),
            ),
          ))
        ]),
      ),
    );
  }
}
