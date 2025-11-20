import 'package:equatable/equatable.dart';

enum MessageRole { user, assistant, system }

class ChatMessage extends Equatable {
  final String id;
  final String content;
  final MessageRole role;
  final DateTime timestamp;
  final bool isLoading;
  final bool hasError;

  const ChatMessage({
    required this.id,
    required this.content,
    required this.role,
    required this.timestamp,
    this.isLoading = false,
    this.hasError = false,
  });

  // Helper getter for UI
  bool get isUser => role == MessageRole.user;
  bool get isAssistant => role == MessageRole.assistant;

  // Factory constructor for user messages
  factory ChatMessage.user(String content) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      role: MessageRole.user,
      timestamp: DateTime.now(),
    );
  }

  // Factory constructor for assistant messages
  factory ChatMessage.assistant(String content) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      role: MessageRole.assistant,
      timestamp: DateTime.now(),
    );
  }

  // Factory constructor for loading state
  factory ChatMessage.loading() {
    return ChatMessage(
      id: 'loading_${DateTime.now().millisecondsSinceEpoch}',
      content: '',
      role: MessageRole.assistant,
      timestamp: DateTime.now(),
      isLoading: true,
    );
  }

  // Factory constructor for error messages
  factory ChatMessage.error(String errorMessage) {
    return ChatMessage(
      id: 'error_${DateTime.now().millisecondsSinceEpoch}',
      content: errorMessage,
      role: MessageRole.assistant,
      timestamp: DateTime.now(),
      hasError: true,
    );
  }

  // CopyWith method for immutability
  ChatMessage copyWith({
    String? id,
    String? content,
    MessageRole? role,
    DateTime? timestamp,
    bool? isLoading,
    bool? hasError,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      role: role ?? this.role,
      timestamp: timestamp ?? this.timestamp,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  // For state comparison (Equatable)
  @override
  List<Object?> get props => [
    id,
    content,
    role,
    timestamp,
    isLoading,
    hasError,
  ];

  // For debugging
  @override
  String toString() {
    return 'ChatMessage(id: $id, role: $role, content: ${content.substring(0, content.length > 20 ? 20 : content.length)}..., isLoading: $isLoading)';
  }
}
