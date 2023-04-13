import 'package:empat_app/core/constants.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/widgets/search_song/search_song_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListenButton extends StatefulWidget implements PreferredSizeWidget {
  const ListenButton({super.key});

  @override
  State<ListenButton> createState() => _ListenButtonState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(100, 60);
}

class _ListenButtonState extends State<ListenButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Column(
        children: [
          Container(
            color: surfaceColor,
            height: 30,
            width: double.infinity,
          ),
          Container(
            color: backgroundColor,
            height: 30,
            width: double.infinity,
          ),
        ],
      ),
      Positioned(
        top: 59,
        left: 0,
        right: 0,
        child: Container(
          color: backgroundColor,
          height: 2,
          width: double.infinity,
        ),
      ),
      Positioned(
        top: 0,
        left: 100,
        right: 100,
        child: Container(
          width: 90,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: accentColor,
            border: Border.all(),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: context.read<PlaylistCubit>().playOrPause,
              child: Ink(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.keyboard_double_arrow_right_sharp),
                    Text("LISTEN"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
