import 'dart:collection';

import 'package:empat_app/core/constants.dart';
import 'package:empat_app/models/product.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final List<Product> _products = [...constProducts];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  void setFavoritness(String id, bool value) {
    _products.firstWhere((element) => element.id == id).isFavorite = value;
//    notifyListeners();
  }

  void setRating(String id, int value) {
    _products.firstWhere((element) => element.id == id).rating = value;
    //  notifyListeners();
  }

  UnmodifiableListView<Product> get favoriteProducts =>
      UnmodifiableListView(_products.where((element) => element.isFavorite));

  UnmodifiableListView<Product> get productsByRating =>
      UnmodifiableListView([..._products]..sort(
          (a, b) => b.rating.compareTo(a.rating),
        ));
}
