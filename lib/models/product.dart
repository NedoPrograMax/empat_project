import 'package:uuid/uuid.dart';

class Product {
  final String imageUrl;
  final String title;
  final String description;
  final String id;
  int rating;
  bool isFavorite;

  Product({
    required this.imageUrl,
    required this.title,
    required this.description,
  })  : id = const Uuid().v4(),
        isFavorite = false,
        rating = 0;
}
