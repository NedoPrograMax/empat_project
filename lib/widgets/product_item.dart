import 'package:empat_app/providers/app_state.dart';
import 'package:empat_app/widgets/cached_image.dart';
import 'package:empat_app/widgets/draggable_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import "package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart";

import 'stars.dart';

typedef ChangeCart = void Function(int);

class ProductItem extends StatefulWidget {
  final Product product;
  final ChangeCart changeCart;
  const ProductItem({
    required this.product,
    required this.changeCart,
    super.key,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void _addToCard() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
    });
    widget.changeCart(widget.product.isFavorite ? 1 : -1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 0.8)),
      child: ConfigurableExpansionTile(
        header: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DraggableImage(widget.product.imageUrl, widget.product.id),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      widget.product.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Stars(
                  widget.product.rating,
                  (value) {
                    context
                        .read<AppState>()
                        .setRating(widget.product.id, value);
                  },
                ),
              ],
            ),
          ),
        ),
        childrenBody: Column(
          children: [
            Text(widget.product.description),
            ElevatedButton(
              onPressed: _addToCard,
              child: Text(
                widget.product.isFavorite ? "Remove from cart" : "Add to cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
