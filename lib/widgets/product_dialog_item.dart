import 'package:empat_app/models/product.dart';
import 'package:empat_app/providers/app_state.dart';
import 'package:empat_app/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ProductDialogItem extends StatelessWidget {
  final Product product;
  const ProductDialogItem(this.product, {super.key});

  Future<bool?> _confirmDismiss(
      DismissDirection direction, BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          ElevatedButton(
            child: const Text("No"),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text("Yes"),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
        title: Text(
            "Are you sure you want to ${direction == DismissDirection.endToStart ? "delete" : "buy"}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Dismissible(
          key: ValueKey(product.id),
          direction: DismissDirection.horizontal,
          onDismissed: (direction) =>
              context.read<AppState>().setFavoritness(product.id, false),
          confirmDismiss: (direction) => _confirmDismiss(direction, context),
          background: Container(
            color: Colors.green,
            child: Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Buy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.monetization_on),
              ],
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Remove",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.delete),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          child: ListTile(
            leading: CachedImage(product.imageUrl),
            title: Text(product.title),
            subtitle: Text(product.description),
          ),
        ),
      ),
    );
  }
}
