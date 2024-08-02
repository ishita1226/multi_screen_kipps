import 'package:flutter/material.dart';
import 'package:kipps_chatbot/kipps_chatbot.dart';

class CommonScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const CommonScaffold({
    required this.title,
    required this.body,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: const ChatbotIntegration(
        chatbotId: 'c948d814-9f8c-43e9-a244-ff19b6b4404f', // Update with your chatbot ID
      ),
    );
  }
}
