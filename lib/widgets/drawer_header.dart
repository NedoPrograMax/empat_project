import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets\\background_1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage("assets\\avatar_10.jpg"),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Myself"),
          SizedBox(
            height: 10,
          ),
          Text(
            "+ 380 (66) 123 45 67",
            style: TextStyle(color: Color.fromARGB(255, 189, 187, 187)),
          ),
        ],
      ),
    );
  }
}
