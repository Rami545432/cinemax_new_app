import 'package:cinemax_app_new/features/Bot/presentation/blocs/chat_bloc.dart';
import 'package:cinemax_app_new/features/Bot/presentation/blocs/chat_event.dart';
import 'package:cinemax_app_new/features/Bot/presentation/views/chat_bot_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocProvider(
        create: (context) => ChatBloc()..add(const InitializeChatEvent()),
        child: const AiChatScreen(),
      ),
    ),
  );
}
