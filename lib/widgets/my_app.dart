import 'package:empat_app/ball/ball_screen.dart';
import 'package:empat_app/plant/plant_screen.dart';
import 'package:flutter/material.dart';

import '../diagram/widgets/diagram_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        animationDuration: Duration(milliseconds: 300),
        child: TabBarView(children: [
          const DiagramScreen(),
          const BallScreen(),
          PlantScreen(),
        ]),
      ),
    );
  }
}
