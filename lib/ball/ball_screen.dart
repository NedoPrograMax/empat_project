import 'package:empat_app/ball/custom_animation.dart';
import 'package:flutter/material.dart';

class BallScreen extends StatelessWidget {
  const BallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomAnimation(),
        ),
      ),
    );
  }
}
