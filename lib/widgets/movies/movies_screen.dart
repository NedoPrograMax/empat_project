import 'package:empat_app/models/movie.dart';
import 'package:empat_app/widgets/movies/movies_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/data_source.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late final Iterable<Movie> _movies;

  @override
  void initState() {
    _movies = context.read<DataSource>().getCurrentMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<DataSource>().currentCategory.name),
      ),
      body: MoviesGrid(
        movies: _movies,
      ),
    );
  }
}
