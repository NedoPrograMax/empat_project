import 'dart:async';

import 'package:flutter/material.dart';

import 'song_screen_content.dart';

class SongScreen extends StatelessWidget {
  SongScreen({super.key});
  StreamSubscription<int?>? lastSubscriber;

  bool shouldWait = false;

  @override
  Widget build(BuildContext context) {
    return const SongScreenContent();
  }
}
