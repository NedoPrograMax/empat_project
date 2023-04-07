import 'package:flutter/material.dart';

import '../../../models/weather.dart';

import '../../dialogs/multi_dialog.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => const MultiDialog(),
      ),
      child: Text(
        "${weather.location.name}, ${weather.location.region}, ${weather.location.country}",
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18,
        ),
      ),
    );
  }
}
