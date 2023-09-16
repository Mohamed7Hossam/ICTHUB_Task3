import 'package:flutter/material.dart';

import 'screen/home.dart';



void main() {
  runApp(const ICTAPP());
}

class ICTAPP extends StatelessWidget {
  const ICTAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myHome(),
    );
  }
}