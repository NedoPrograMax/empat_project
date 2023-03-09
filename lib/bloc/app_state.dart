import 'package:empat_app/models/category.dart';
import 'package:empat_app/models/chat.dart';

abstract class AppState {}

class MainState extends AppState {
  final List<Chat> chats;
  final int chosedId;

  MainState({
    required this.chats,
    required this.chosedId,
  });
}
