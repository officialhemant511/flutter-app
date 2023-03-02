import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

// we just put header in different column-->
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("MY app")// same this as above
        "My App".text.xl5.bold.color(context.theme.errorColor).make(),
        "Treanding products".text.xl2.color(context.theme.errorColor).make(),
        // Text("MY app")// same this as above
      ],
    );
  }
}
