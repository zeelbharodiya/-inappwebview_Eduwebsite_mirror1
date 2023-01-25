import 'package:flutter/material.dart';
import 'package:mirrorwall_1/site1.dart';

import 'homepage.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        'Site1' : (context) => Site1(),
      },
      // home: HomePage(),
    ),
  );
}