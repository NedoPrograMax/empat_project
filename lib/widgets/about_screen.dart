import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "All music is from freemusicarchive.org.\n\n All images are from freemusicarchive.org and Wikipedia",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
