import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'global.dart';

class Site1 extends StatefulWidget {
  const Site1({Key? key}) : super(key: key);

  @override
  State<Site1> createState() => _Site1State();
}

class _Site1State extends State<Site1> {
  @override
  InAppWebViewController? inAppWebViewController;
  int currentitem = 0;

  Widget build(BuildContext context) {
    Map siteALL = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("${siteALL['site']}"),
          ),
          onWebViewCreated: (controller) {
            setState(() {
              inAppWebViewController = controller;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: Colors.green),
      currentIndex: currentitem,
      onTap: (val) {
        setState(() {
          currentitem = val;
        });
      },
      items: [
        BottomNavigationBarItem(icon: GestureDetector(
          onTap: () {
            setState(() async {
              await inAppWebViewController?.goBack();
            });
          },
            child: Icon(Icons.arrow_back_ios)),label: "",),
        BottomNavigationBarItem(icon: GestureDetector(
            onTap: () {
              setState(() async {
                await inAppWebViewController?.goForward();
              });
            },
            child: Icon(Icons.arrow_forward_ios,)),label: ""),
        BottomNavigationBarItem(icon: GestureDetector(
            onTap: () {
              setState(()  {
                 Navigator.pop(context);
                // await inAppWebViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse("${siteALL['site']}")));
              });
            },
            child: Icon(Icons.home_outlined,)),label: ""),
        BottomNavigationBarItem(icon: GestureDetector(
            onTap: () {
              setState(() async {
                await inAppWebViewController?.reload();
              });
            },
            child: Icon(Icons.refresh,)),label: ""),
      ],
     ),
    );
  }
}
