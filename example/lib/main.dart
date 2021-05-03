import 'package:flutter/material.dart';
import 'package:text_appear_animation/shuffle.dart';
import 'package:text_appear_animation/text_appear_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('example app'),
        ),
        body: Center(
          child: Container(
            width: 220,
            height: 300,
            alignment: Alignment.centerLeft,
            child: TextAppearAnimation(
              ShuffleAnimatedText('flutter'),
            )
          )
        ),
      ),
    );
  }
}
