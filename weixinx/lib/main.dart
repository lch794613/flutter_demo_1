import 'package:flutter/material.dart';
import 'homePage/homePage.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor:Color(appBarColor),
        cardColor:Color(appBarColor)
      ),
      debugShowCheckedModeBanner: false,
      title: "微信",
      home: HomePage());
  }

}




