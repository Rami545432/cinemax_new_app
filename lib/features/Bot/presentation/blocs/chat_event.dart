import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
  @override
  List<Object?> get props => [];
}

class InitializeChatEvent extends ChatEvent {
  const InitializeChatEvent();
}

class SendMessageEvent extends ChatEvent {
  final String message;
  const SendMessageEvent({required this.message});
  @override
  List<Object?> get props => [message];
}

class ClearChatEvent extends ChatEvent {
  const ClearChatEvent();
  @override
  List<Object?> get props => [];
}
