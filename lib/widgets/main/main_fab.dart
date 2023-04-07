import 'package:flutter/material.dart';

import '../dialogs/settings_dialog.dart';

class MainFAB extends StatelessWidget {
  const MainFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.more_vert_outlined,
        size: 30,
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => const SettingsDialog(),
      ),
    );
  }
}
