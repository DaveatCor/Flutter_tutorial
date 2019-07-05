import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
import '../model/model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider{
  Client client = Client(); 
  fetchTopIds() async{
    final response = await client.get('$_root/topstories.json');
    final id = json.decode(response.body);  
    return id;
  }
  fetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}