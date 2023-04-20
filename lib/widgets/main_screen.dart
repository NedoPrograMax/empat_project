import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'main_navigation_bar.dart';
import 'navigator_screen.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return Scaffold(
      body: NavigatorScreen(currentIndex),
      bottomNavigationBar: MainNavigationBar(currentIndex),
    );
  }
}
