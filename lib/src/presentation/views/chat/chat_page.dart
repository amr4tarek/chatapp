import 'package:chatapp/src/presentation/blocs/chat_bloc/chat_bloc.dart';
import 'package:chatapp/src/presentation/views/chat/components/message_input.dart';
import 'package:chatapp/src/presentation/views/chat/components/messagetile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  final String username;
  final String chatRoomId;
  final String userId;
  const ChatPage(
      {super.key,
      required this.username,
      required this.chatRoomId,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(firestore: FirebaseFirestore.instance)
        ..add(LoadMessages(chatRoomId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(username,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary, fontSize: 25)),
          // automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor:
              Colors.transparent, //Theme.of(context).colorScheme.primary,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey.withOpacity(0.8),
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is MessagesLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MessagesLoaded) {
                    return ListView.builder(
                      itemCount: state.messages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        var data = state.messages[index].data()
                            as Map<String, dynamic>;
                        return ListTile(
                          // title: Text(data['text']),
                          title: messageTile(
                            message: data['text'],
                            sentByMe: data['userId'] == userId,
                            maxwidth: MediaQuery.of(context).size.width,
                          ),
                          // subtitle: Text('Sent at ${data['timestamp']}'),
                        );
                      },
                    );
                  } else {
                    return Text('Unable to load messages');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MessageInput(chatRoomId: chatRoomId, userId: userId),
            ),
          ],
        ),
      ),
    );
  }
}
