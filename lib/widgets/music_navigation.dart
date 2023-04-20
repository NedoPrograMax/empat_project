import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../routes/routes_generator.dart';

class MusicNavigation extends StatelessWidget {
  const MusicNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Navigator(
      initialRoute: "/",
      onGenerateRoute: RoutesGenerator.generateRoute,
    );
  }
}
