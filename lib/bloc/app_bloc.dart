import 'package:empat_app/constants.dart';
import 'package:empat_app/models/category_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empat_app/extensions.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          MainState(chats: chatItems, chosedId: CategoryType.All.index),
        ) {
    on<EventChooseCategoty>((event, emit) {
      emit(
        MainState(
            chats: chatItems.getChatsWithType(event.type),
            chosedId: event.type.index),
      );
    });
  }
}
