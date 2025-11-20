import 'package:cinemax_app_new/features/Bot/models/chat_message_model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

// Initial state
class ChatInitial extends ChatState {
  const ChatInitial();
}

// Loading state (first time setup)
class ChatLoading extends ChatState {
  const ChatLoading();
}

// Chat is ready with messages
class ChatLoaded extends ChatState {
  final List<ChatMessage> messages;
  final bool isSending; // True when waiting for AI response

  const ChatLoaded({required this.messages, this.isSending = false});

  // Copy with for state updates
  ChatLoaded copyWith({List<ChatMessage>? messages, bool? isSending}) {
    return ChatLoaded(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
    );
  }

  @override
  List<Object?> get props => [messages, isSending];
}

// Error state
class ChatError extends ChatState {
  final String message;
  final List<ChatMessage> messages; // Keep previous messages

  const ChatError({required this.message, required this.messages});

  @override
  List<Object?> get props => [message, messages];
}
