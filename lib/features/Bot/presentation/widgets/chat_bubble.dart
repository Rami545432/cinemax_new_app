import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/Bot/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bot avatar (left side)
          if (!message.isUser) ...[
            _buildAvatar(context, isUser: false),
            const SizedBox(width: 8),
          ],

          // Message bubble
          Flexible(
            child: GestureDetector(
              onLongPress: () => _copyToClipboard(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: _getBubbleColor(context),
                  borderRadius: _getBorderRadius(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Message content
                    Text(
                      message.content,
                      style: TextStyle(
                        color: _getTextColor(context),
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),

                    // Timestamp
                    const SizedBox(height: 6),
                    Text(
                      _formatTime(message.timestamp),
                      style: TextStyle(
                        fontSize: 11,
                        color: message.isUser
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // User avatar (right side)
          if (message.isUser) ...[
            const SizedBox(width: 8),
            _buildAvatar(context, isUser: true),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, {required bool isUser}) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isUser
            ? Theme.of(context).primaryColor
            : Colors.deepPurple.shade100,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isUser
            ? const Icon(Icons.person, color: Colors.white, size: 20)
            : Text('🤖', style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  Color _getBubbleColor(BuildContext context) {
    if (message.hasError) {
      return Colors.red.shade50;
    }
    if (message.isUser) {
      return Theme.of(context).primaryColor;
    }
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.grey.shade100;
  }

  Color _getTextColor(BuildContext context) {
    if (message.hasError) {
      return Colors.red.shade900;
    }
    if (message.isUser) {
      return Colors.white;
    }
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;
  }

  BorderRadius _getBorderRadius() {
    if (message.isUser) {
      return const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(4),
      );
    } else {
      return const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(4),
        bottomRight: Radius.circular(20),
      );
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: message.content));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Message copied to clipboard',
          style: AppStyles.textStyle14(context),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
