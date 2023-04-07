import 'package:empat_app/widgets/dialogs/degree_choser.dart';
import 'package:empat_app/widgets/dialogs/theme_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("www.weatherapi.com is used"),
            DegreeChooser(),
            ThemeChooser(),
          ],
        ),
      ),
    );
  }
}
