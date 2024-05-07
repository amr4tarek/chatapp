import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseFirestore firestore;

  ChatBloc({required this.firestore}) : super(MessagesLoading()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
  }

  void _onLoadMessages(LoadMessages event, Emitter<ChatState> emit) async {
    emit(MessagesLoading());
    try {
      var messageCollection = firestore
          .collection('chats')
          .doc(event.chatRoomId)
          .collection('messages');
      var snapshots =
          messageCollection.orderBy('timestamp', descending: true).snapshots();
      await emit.forEach<List<DocumentSnapshot>>(
        snapshots.map((snapshot) => snapshot.docs),
        onData: (docs) => MessagesLoaded(docs),
        onError: (_, __) => MessagesError(),
      );
    } catch (e) {
      emit(MessagesError());
    }
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    try {
      var messageCollection = firestore
          .collection('chats')
          .doc(event.chatRoomId)
          .collection('messages');
      var timestamp = FieldValue.serverTimestamp();
      await messageCollection.add({
        'text': event.message,
        'userId': event.userId,
        'timestamp': timestamp,
      });
      emit(MessageSent());
    } catch (e) {
      emit(MessagesError());
    }
  }
}
