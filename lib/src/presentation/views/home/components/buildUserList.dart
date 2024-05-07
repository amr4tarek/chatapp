import 'package:chatapp/src/presentation/blocs/chat_bloc/chat_bloc.dart';
import 'package:chatapp/src/presentation/views/chat/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String _createChatRoomId(String user1Id, String user2Id) {
  List<String> ids = [user1Id, user2Id];
  ids.sort();
  return ids.join('_');
}

Widget buildUserList(List<Map<String, dynamic>> users) {
  return ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index) {
      return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) =>
                          ChatBloc(firestore: FirebaseFirestore.instance)
                            ..add(LoadMessages(_createChatRoomId(
                                FirebaseAuth.instance.currentUser!.uid,
                                users[index]['userId']))),
                      child: ChatPage(
                        username: users[index]['name'],
                        chatRoomId: _createChatRoomId(
                            FirebaseAuth.instance.currentUser!.uid,
                            users[index]['userId']),
                        userId: FirebaseAuth.instance.currentUser!.uid,
                      ),
                    )));
          },
          child: usertile(users[index]['name'], users[index]['email'],
              Theme.of(context).colorScheme.tertiary));
    },
  );
}

Widget usertile(String name, String email, Color color) {
  if (email.toLowerCase() != FirebaseAuth.instance.currentUser!.email) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.person, color: color),
        title: Text(name),
        // subtitle: Text(email),
      ),
    );
  }
  return const SizedBox(); // Use SizedBox for an empty space
}
