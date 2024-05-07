import 'package:chatapp/src/presentation/blocs/chat_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({
    Key? key,
    required this.chatRoomId,
    required this.userId,
  }) : super(key: key);

  final String chatRoomId;
  final String userId;

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onSubmitted: (value) {
                  _sendMessage(value);
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _sendMessage(_messageController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      context.read<ChatBloc>().add(
            SendMessage(
              chatRoomId: widget.chatRoomId,
              message: message,
              userId: widget.userId,
            ),
          );
      _messageController.clear();
    }
  }
}
