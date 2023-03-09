import 'package:empat_app/extensions.dart';
import 'package:empat_app/models/category_type.dart';
import 'package:empat_app/models/chat.dart';
import 'package:empat_app/models/drawer_item_model.dart';
import 'package:flutter/material.dart';

final drawerItems = [
  DrawerItemModel(icon: Icons.people_alt_outlined, name: "New group"),
  DrawerItemModel(icon: Icons.person_outline, name: "Contacts"),
  DrawerItemModel(icon: Icons.phone_outlined, name: "Calls"),
  DrawerItemModel(icon: Icons.person_pin_circle_outlined, name: "New group"),
  DrawerItemModel(icon: Icons.bookmark_outline, name: "Saved"),
  DrawerItemModel(icon: Icons.settings_outlined, name: "Settings"),
  DrawerItemModel(icon: Icons.person_add_outlined, name: "Add Friends"),
  DrawerItemModel(icon: Icons.question_mark_outlined, name: "Possibilities"),
];

final chatItems = [
  Chat(
    immageAsset: "assets\\avatar_1.jpg",
    username: "Andrew",
    lastMessage: "Hello! I wanted to talk with you about our little situation",
    time: const TimeOfDay(hour: 9, minute: 15),
    countOfUnread: 0,
    type: CategoryType.Work,
  ),
  Chat(
    immageAsset: "assets\\avatar_2.png",
    username: "Jack",
    lastMessage: "Good Mooooorning",
    time: const TimeOfDay(hour: 4, minute: 20),
    countOfUnread: 0,
    type: CategoryType.Personal,
  ),
  Chat(
    immageAsset: "assets\\avatar_7.png",
    username: "Ross",
    lastMessage: "Have a good day",
    time: const TimeOfDay(hour: 8, minute: 44),
    countOfUnread: 0,
    type: CategoryType.Work,
  ),
  Chat(
    immageAsset: "assets\\avatar_4.jpg",
    username: "Judy",
    lastMessage: "I miss you....",
    time: const TimeOfDay(hour: 10, minute: 44),
    countOfUnread: 12,
    type: CategoryType.Personal,
  ),
  Chat(
    immageAsset: "assets\\avatar_3.png",
    username: "Amily",
    lastMessage: "Well... I don't think so",
    time: const TimeOfDay(hour: 13, minute: 21),
    countOfUnread: 1,
    type: CategoryType.Personal,
  ),
  Chat(
    immageAsset: "assets\\avatar_6.png",
    username: "Joanna",
    lastMessage: "How you doin?",
    time: const TimeOfDay(hour: 14, minute: 45),
    countOfUnread: 0,
    type: CategoryType.Personal,
  ),
  Chat(
    immageAsset: "assets\\avatar_5.jpg",
    username: "Mr Robinson",
    lastMessage:
        "Your task for today would be to develop an awesome mobila application using...",
    time: const TimeOfDay(hour: 12, minute: 10),
    countOfUnread: 1,
    type: CategoryType.Work,
  ),
  Chat(
    immageAsset: "assets\\avatar_8.png",
    username: "Jackson",
    lastMessage: "I hope you're gonna do it in time",
    time: const TimeOfDay(hour: 13, minute: 23),
    countOfUnread: 0,
    type: CategoryType.Work,
  ),
  Chat(
    immageAsset: "assets\\avatar_9.png",
    username: "Chandler",
    lastMessage:
        "I'm not great at the advice, can I intereset you with a sarcatic comment?",
    time: const TimeOfDay(hour: 14, minute: 36),
    countOfUnread: 2,
    type: CategoryType.Personal,
  ),
]..sortByTime();

late final categories = chatItems.getCategories();

const mainColor = Color.fromARGB(252, 29, 39, 51);

const subMainColor = Color.fromRGBO(88, 163, 229, 1);
