import 'package:empat_app/models/product.dart';
import 'package:empat_app/providers/app_state.dart';

import 'package:empat_app/widgets/cart_icon.dart';
import 'package:empat_app/widgets/drag_target_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_dialog.dart';
import 'product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;
  late Iterable<Product> products;

  void changeFavoriteNumber(int value) {
    setState(() {
      number += value;
    });
  }

  @override
  void initState() {
    products = context.read<AppState>().products;
    super.initState();
  }

  void _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10),
        child: CartDialog(),
      ),
    );
    setState(() {
      number = context.read<AppState>().favoriteProducts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Empat app"), actions: [
        IconButton(
          onPressed: () => _showDialog(context),
          icon: CartIcon(number: number),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              products = context.read<AppState>().productsByRating;
            });
          },
          icon: const Icon(Icons.filter_alt_sharp),
        ),
      ]),
      body: Column(
        children: [
          DragTargetLine(changeCart: changeFavoriteNumber),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ProductItem(
                key: ValueKey(products.elementAt(index).id),
                product: products.elementAt(index),
                changeCart: changeFavoriteNumber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
