import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    WebUri? webUri = WebUri.uri(Uri.tryParse(url)!);

    if (webUri == null || !webUri.hasScheme) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: Colors.lightBlue[400],
        ),
        body: const Center(
          child: Text('Invalid URL'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        backgroundColor: Colors.lightBlue[400],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: webUri),
        onWebViewCreated: (controller) {
          // You can save the controller for further use if needed
        },
      ),
    );
  }
}
