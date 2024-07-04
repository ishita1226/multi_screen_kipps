import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  const ChatbotApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatbotHomePage(),
    );
  }
}

class ChatbotHomePage extends StatefulWidget {
  const ChatbotHomePage({super.key});
  @override
  _ChatbotHomePageState createState() => _ChatbotHomePageState();
}

class _ChatbotHomePageState extends State<ChatbotHomePage> {
  final String _chatbotUrl = 'https://app.kipps.ai/iframe/c948d814-9f8c-43e9-a244-ff19b6b4404f';

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void _showChatbotModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9, // Adjust the height factor as needed
          child: Stack(
            children: [
              WebView(
                initialUrl: _chatbotUrl,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot Integrated Application'),
      ),
      body: const Center(
        child: Text('Welcome to the App!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showChatbotModal(context),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
