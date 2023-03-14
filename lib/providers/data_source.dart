import 'dart:collection';

import 'package:empat_app/constants.dart';
import 'package:empat_app/models/categories.dart';
import 'package:empat_app/models/movie.dart';
import 'package:flutter/cupertino.dart';

class DataSource extends ChangeNotifier {
  final List<Movie> _movies = [...constMovies];
  Categories currentCategory = Categories.Action;

  DataSource();

  UnmodifiableListView<Movie> getCurrentMovies({bool onlyFavorite = false}) =>
      UnmodifiableListView(_getCurrentMovies(onlyFavorite));

  Movie getMovieById(int id) =>
      _movies.firstWhere((element) => element.id == id);

  Iterable<Movie> _getCurrentMovies(bool onlyFavorite) =>
      _movies.where((movie) {
        final isCategoryRight = movie.category == currentCategory;
        return onlyFavorite ? movie.isFavorite : isCategoryRight;
      });

  void notify() {
    notifyListeners();
  }

  void toggleFavoritness(Movie movie) {
    final index =
        _movies.indexWhere((thisMovie) => thisMovie.title == movie.title);
    _movies[index] =
        _movies[index].copyWithIsFavorite(!_movies[index].isFavorite);
  }
}
