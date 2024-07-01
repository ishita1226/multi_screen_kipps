import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {

  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();

}

class _WebViewPageState extends State<WebViewPage> {

  final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://app.kipps.ai/iframe/c948d814-9f8c-43e9-a244-ff19b6b4404f'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter WebView"),
        ),
        body: Container(
          height: double.infinity,
            child: WebViewWidget(controller: webViewController)));
  }
}