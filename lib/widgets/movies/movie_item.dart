import 'package:empat_app/core/routes.dart';
import 'package:empat_app/models/movie.dart';
import 'package:empat_app/providers/which_movie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.read<WhichMovie>().id = movie.id;
        Navigator.of(context).pushNamed(RouteGenerator.movieScreen);
      },
      child: Ink(
        child: Hero(
          tag: movie.imageAsset,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  movie.imageAsset,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  spreadRadius: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
