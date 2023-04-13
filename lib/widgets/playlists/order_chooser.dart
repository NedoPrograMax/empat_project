import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderChooser extends StatelessWidget {
  const OrderChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: const [
          Icon(Icons.arrow_back_ios_new),
          Text(
            "Recently listened",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
