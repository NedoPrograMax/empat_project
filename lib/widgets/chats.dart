import 'package:empat_app/bloc/app_bloc.dart';
import 'package:empat_app/bloc/app_state.dart';
import 'package:empat_app/constants.dart';
import 'package:empat_app/models/chat.dart';
import 'package:empat_app/widgets/chat_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_event.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.8),
          ),
        ),
        child: ListView.builder(
          itemCount: (state as MainState).chats.length,
          itemBuilder: (context, index) => ChatItem(
            chat: state.chats[index],
          ),
        ),
      ),
    );
  }
}
