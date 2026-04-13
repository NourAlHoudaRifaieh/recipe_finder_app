import 'package:flutter/material.dart';

import 'IngedientInputScreen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Recipe Finder",
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Arial",
      ),
      home: IngredientInputScreen(),
    );
  }
}


