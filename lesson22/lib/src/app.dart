import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News!',
      home: NewsList(),
    );
  }
}