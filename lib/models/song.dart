import 'package:empat_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Song {
  final String title;
  final String band;
  final ImageProvider image;
  final String imageUrl;
  final String musicAsset;
  final String id;
  Color? mainColor;

  Song({
    required this.title,
    required this.band,
    required this.imageUrl,
    required this.musicAsset,
  })  : image = NetworkImage(imageUrl),
        id = const Uuid().v4();

  Song.empty()
      : title = "",
        band = "",
        image = const NetworkImage("url"),
        imageUrl = "",
        musicAsset = "",
        id = "",
        mainColor = surfaceColor;
}
