import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/data_source.dart';

class FABFavorite extends StatefulWidget {
  const FABFavorite({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<FABFavorite> createState() => _FABFavoriteState();
}

class _FABFavoriteState extends State<FABFavorite> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.movie.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<DataSource>().toggleFavoritness(widget.movie);
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
    );
  }
}
