import 'package:flutter/material.dart';

import 'category_type.dart';

class Chat {
  final String immageAsset;
  final String username;
  final String lastMessage;
  final TimeOfDay time;
  final int countOfUnread;
  final CategoryType type;

  Chat({
    required this.immageAsset,
    required this.username,
    required this.lastMessage,
    required this.time,
    required this.countOfUnread,
    required this.type,
  });
}
