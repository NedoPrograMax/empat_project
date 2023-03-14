import 'package:empat_app/models/categories.dart';

class Movie {
  final int id;
  final String title;
  final String imageAsset;
  final String description;
  final bool isFavorite;
  final Categories category;

  const Movie({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.description,
    required this.category,
    this.isFavorite = false,
  });

  Movie copyWithIsFavorite(bool newValue) => Movie(
        id: id,
        title: title,
        imageAsset: imageAsset,
        description: description,
        category: category,
        isFavorite: newValue,
      );
}
