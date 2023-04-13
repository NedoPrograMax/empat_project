import 'package:empat_app/core/extensions.dart';
import 'package:empat_app/models/song.dart';
import 'package:empat_app/state/search_cubit/search_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  final List<Song> songs;
  SearchCubit({
    required this.songs,
  }) : super(
          SearchCubitState(songs),
        );

  void search(String text) {
    emit(SearchCubitState(songs.search(text)));
  }
}
