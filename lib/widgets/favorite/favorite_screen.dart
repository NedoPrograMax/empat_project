import 'package:empat_app/providers/data_source.dart';
import 'package:empat_app/widgets/movie/movie_screen.dart';
import 'package:empat_app/widgets/movies/movies_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../movies/movies_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movies =
        context.watch<DataSource>().getCurrentMovies(onlyFavorite: true);
    return MoviesGrid(movies: movies);
  }
}
