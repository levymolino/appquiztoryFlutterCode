 import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

   @override
   WebViewExampleState createState() => WebViewExampleState();
 }

 class WebViewExampleState extends State<WebViewExample> {
   @override
   void initState() {
     super.initState();
         // Enable hybrid composition.
 if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return const WebView(
       initialUrl: 'https://levymolino.wixsite.com/quiztory',
     );
   }
 }