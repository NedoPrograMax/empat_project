import 'package:empat_app/providers/app_state.dart';
import 'package:empat_app/widgets/cached_image.dart';
import 'package:empat_app/widgets/product_dialog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CartDialog extends StatelessWidget {
  const CartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context
        .read<AppState>()
        .products
        .where((element) => element.isFavorite);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) => ProductDialogItem(
          products.elementAt(index),
        ),
      ),
    );
  }
}
