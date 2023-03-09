import 'package:empat_app/models/chat.dart';
import 'package:empat_app/widgets/unread_count.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    required this.chat,
    super.key,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 0.3),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(chat.immageAsset),
            //  child: Image.asset(),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(216, 255, 255, 255),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  chat.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 211, 210, 210),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                chat.time.format(context),
              ),
              const SizedBox(
                height: 12,
              ),
              UnreadCount(
                count: chat.countOfUnread,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
