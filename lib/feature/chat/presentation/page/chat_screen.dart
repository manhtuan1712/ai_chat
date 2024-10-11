import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/base/widget/base_require_login_widget.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return context.watch<AppProvider>().accessToken.isEmpty
        ? const BaseRequireLoginWidget()
        : Container();
  }
}
