import 'package:empat_app/models/movie.dart';
import 'package:empat_app/providers/data_source.dart';
import 'package:empat_app/providers/which_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'fab_favoritness.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = context.read<DataSource>().getMovieById(
          context.read<WhichMovie>().id,
        );
    return WillPopScope(
      onWillPop: () async {
        context.read<DataSource>().notify();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Hero(
                  tag: movie.imageAsset,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(movie.imageAsset, fit: BoxFit.fitWidth),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    decorationStyle: TextDecorationStyle.double,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movie.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FABFavorite(movie: movie),
      ),
    );
  }
}
