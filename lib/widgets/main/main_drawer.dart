import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:empat_app/widgets/main/theme_swticher_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets\\images\\movie_background.jpg"),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text(
                    "Used technologies:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Provider"),
                  const Text("Animated Theme Switcher"),
                  const Text("All images are from IMDB"),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
