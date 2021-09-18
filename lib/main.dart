import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: WebViewLoad()
        )
    );
  }
}

class WebViewLoad extends StatefulWidget {

  WebViewLoadUI createState() => WebViewLoadUI();

}

class WebViewLoadUI extends State<WebViewLoad>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('PAYMENT ')),
        body: WebView(
          initialUrl: 'https://paystack.com/pay/bp4--mcg3o',
          javascriptMode: JavascriptMode.unrestricted,
          userAgent: 'Flutter;Webview',
          navigationDelegate: (navigation){
            //Listen for callback URL
            if(navigation.url == "https://hello.pstk.xyz/callback"){

              Navigator.of(context).pop(); //close webview
            }
            return NavigationDecision.navigate;
          },
        )
    );
  }
}