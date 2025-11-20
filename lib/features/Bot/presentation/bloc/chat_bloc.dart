import 'package:cinemax_app_new/features/Bot/models/chat_message_model.dart';
import 'package:cinemax_app_new/features/Bot/presentation/bloc/chat_event.dart';
import 'package:cinemax_app_new/features/Bot/presentation/bloc/chat_states.dart';
import 'package:cinemax_app_new/features/Bot/services/gemini_chat_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GeminiChatService _chatService;
  final List<ChatMessage> _messages = [];

  ChatBloc({GeminiChatService? chatService})
    : _chatService = chatService ?? GeminiChatService(),
      super(ChatInitial()) {
    on<InitializeChatEvent>(_onInitializeChat);
    on<SendMessageEvent>(_onSendMessage);
    on<ClearChatEvent>(_onClearChat);
  }
  Future<void> _onInitializeChat(
    InitializeChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(const ChatLoading());
    final welcomeMessage = ChatMessage.assistant(
      "👋 Hey! I'm your movie & TV show assistant. What are you in the mood for today?\n\nI can help you:\n• Find the perfect movie or show\n• Get recommendations based on your mood\n• Compare different options\n• Discover hidden gems",
    );
    _messages.add(welcomeMessage);
    emit(ChatLoaded(messages: List.from(_messages)));
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    final messageText = event.message.trim();
    if (messageText.isEmpty) {
      return;
    }
    try {
      final userMessage = ChatMessage.user(messageText);
      _messages.add(userMessage);
      emit(ChatLoaded(messages: List.from(_messages), isSending: true));
      final loadingMessage = ChatMessage.loading();
      _messages.add(loadingMessage);
      emit(ChatLoaded(messages: List.from(_messages), isSending: true));
      final response = await _chatService.sendMessage(messageText);
      _messages.removeWhere((msg) => msg.isLoading);
      final botMessage = ChatMessage.assistant(response);
      _messages.add(botMessage);
      emit(ChatLoaded(messages: List.from(_messages), isSending: false));
    } catch (e) {
      _messages.removeWhere((msg) => msg.isLoading);
      final errorMessage = ChatMessage.error(
        "Oops! Something went wrong. Please try again. 😅\n\nError: ${e.toString()}",
      );
      _messages.add(errorMessage);
      emit(ChatLoaded(messages: List.from(_messages), isSending: false));
    }
  }

  Future<void> _onClearChat(
    ClearChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    // Clear messages
    _messages.clear();

    // Clear service history
    _chatService.clearHistory();

    // Add new welcome message
    final welcomeMessage = ChatMessage.assistant(
      "Chat cleared! 🧹 What would you like to watch?",
    );
    _messages.add(welcomeMessage);

    emit(ChatLoaded(messages: List.from(_messages)));
  }

  @override
  Future<void> close() {
    // Clean up if needed
    return super.close();
  }
}
