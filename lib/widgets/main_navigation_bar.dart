import 'package:empat_app/core/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class MainNavigationBar extends HookWidget {
  final ValueNotifier<int> currentIndex;
  const MainNavigationBar(this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: accentColor,
      currentIndex: currentIndex.value,
      onTap: (value) => currentIndex.value = value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.music_note,
          ),
          label: "Music",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more_horiz,
          ),
          label: "About",
        ),
      ],
    );
  }
}
