import 'package:empat_app/providers/data_source.dart';
import 'package:empat_app/providers/which_movie.dart';
import 'package:empat_app/widgets/movies/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';

class MoviesGrid extends StatelessWidget {
  final Iterable<Movie> movies;
  const MoviesGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieItem(
          movie: movies.elementAt(index),
        ),
      ),
    );
  }
}
