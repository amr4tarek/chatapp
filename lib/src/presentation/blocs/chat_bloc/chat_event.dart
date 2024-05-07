part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends ChatEvent {
  final String chatRoomId;

  const LoadMessages(this.chatRoomId);

  @override
  List<Object> get props => [chatRoomId];
}

class SendMessage extends ChatEvent {
  final String chatRoomId;
  final String message;
  final String userId;

  const SendMessage({required this.chatRoomId, required this.message, required this.userId});

  @override
  List<Object> get props => [chatRoomId, message, userId];
}