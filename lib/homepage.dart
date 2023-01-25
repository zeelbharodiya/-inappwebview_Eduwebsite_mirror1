import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'global.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Educational websites",style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Colors.blue,
      ),
      body:
      Container(
        child: Column(
          children: [
            ...Global.webname.map((e) =>
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, 'Site1' , arguments: e);
                    });
                  },
                  child:
                  Container(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child:

                    Text("${e['name']}",style: TextStyle(color: Colors.white,fontSize: 35),),

                    decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
