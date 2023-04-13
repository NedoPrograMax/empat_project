import 'package:empat_app/state/search_cubit/search_cubit.dart';
import 'package:empat_app/state/search_cubit/search_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'searched_song_item.dart';

class SearchedSongsList extends StatelessWidget {
  const SearchedSongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchCubitState>(
      builder: (context, state) => Expanded(
        child: ListView.builder(
          itemCount: state.searchedSongs.length,
          itemBuilder: (context, index) => SearchedSongItem(
            state.searchedSongs[index],
          ),
        ),
      ),
    );
  }
}
