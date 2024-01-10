import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(
      Uri.parse('https://www.intermatico.com/ebanking/seguridad/login.htm'),
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            edgeOffset: 50,
            onRefresh: () async => controller.reload(),
            child: SingleChildScrollView(
              child: SizedBox.fromSize(
                size: MediaQuery.of(context).size,
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
