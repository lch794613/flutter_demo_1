import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: WatchDemo(),
   );
  }
}

class WatchDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return WatchState();
  }
  
}

class WatchState extends State<WatchDemo>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("a stopwatch"),
      ),
      body:Text("x")
      );
     
  }

}