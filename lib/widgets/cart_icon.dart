import 'package:empat_app/widgets/number_circle.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({required this.number, super.key});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        Positioned(
          left: 0,
          right: -20,
          bottom: -8,
          child: NumberCircle(number),
        )
      ],
    );
  }
}
