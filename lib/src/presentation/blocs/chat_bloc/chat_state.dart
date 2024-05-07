part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}

class MessagesLoading extends ChatState {}

class MessagesLoaded extends ChatState {
  final List<DocumentSnapshot> messages;

  const MessagesLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessageSent extends ChatState {}

class MessagesError extends ChatState {}


