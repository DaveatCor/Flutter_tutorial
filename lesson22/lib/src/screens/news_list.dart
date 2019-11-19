import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top news'),
      ),
      body: getList(),
    );
  }

  Widget getList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot) {
            return Container(
              height: 80.0,
              child: snapshot.hasData 
                ? Text("Im visible $index") 
                : Text("Im havent fetch data yey $index"),
            );
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(
      Duration(seconds: 2),
      () => 'Hi'
    );
  }
}