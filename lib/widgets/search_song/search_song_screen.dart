import 'package:empat_app/core/constants.dart';
import 'package:empat_app/widgets/search_song/search_field.dart';
import 'package:empat_app/widgets/search_song/searched_songs_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/search_cubit/search_cubit.dart';

class SearchSongScreen extends StatelessWidget {
  const SearchSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(songs: constSongs),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: const [
            SearchField(),
            SearchedSongsList(),
          ],
        ),
      ),
    );
  }
}
