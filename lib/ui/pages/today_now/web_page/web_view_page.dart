import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final homeUrl = Uri.parse("${url}");

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(homeUrl);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
