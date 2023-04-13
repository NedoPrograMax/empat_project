import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/state/app_cubit/app_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppCubitState(playlists: [...constPlaylists]));

  void updatePlaylist(Playlist playlist) {
    final index =
        state.playlists.indexWhere((element) => element.id == playlist.id);
    state.playlists[index] = playlist;
    emit(AppCubitState(playlists: state.playlists));
  }
}
