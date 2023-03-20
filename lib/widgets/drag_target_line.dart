import 'package:empat_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';

class DragTargetLine extends StatefulWidget {
  final ChangeCart changeCart;
  const DragTargetLine({
    required this.changeCart,
    super.key,
  });

  @override
  State<DragTargetLine> createState() => _DragTargetLineState();
}

class _DragTargetLineState extends State<DragTargetLine> {
  var isInside = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) => Container(
        width: double.infinity,
        height: 50,
        color: isInside ? Colors.amber : null,
        child: Center(
          child: Text(
            isInside ? "Add to cart" : "Drag here to add",
            style: TextStyle(
              fontSize: 32,
              fontWeight: isInside ? FontWeight.bold : null,
              fontStyle: isInside ? FontStyle.italic : null,
              color: Colors.red,
            ),
          ),
        ),
      ),
      onWillAccept: (data) => context
          .read<AppState>()
          .products
          .any((element) => element.id == data && !element.isFavorite),
      onAccept: (data) {
        context.read<AppState>().setFavoritness(data.toString(), true);
        widget.changeCart(1);
        setState(() {
          isInside = false;
        });
      },
      onMove: (details) {
        setState(() {
          isInside = true;
        });
      },
      onLeave: (details) {
        setState(() {
          isInside = false;
        });
      },
    );
  }
}
