import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson21/src/resource/respository.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'src/resource/new_api_provider.dart';
import 'src/model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NewsApiProvider apiProvider = NewsApiProvider();
  @override
  initState(){
    super.initState();
  }

  // fetchDataFromServer() async {
  //   Future<List<int>> futureIds = await apiProvider.fetchTopIds();
  //   itemModel.listId(futureIds);
  // }  

  // fetchMyItem() async {
  //   repo.fetchItem(id);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Hello'),
            RaisedButton(
              child: Text('Click'),
              onPressed: () {
                
              },
            )
          ],
        ),
      ),
    );
  }
}
