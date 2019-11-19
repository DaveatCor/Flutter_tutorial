import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
import '../model/model.dart';
import 'respository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source{
  Client client = Client(); 
  Future<List<int>> fetchTopIds() async{
    final response = await client.get('$_root/topstories.json');
    /* Decode Json Data to default Type */
    final id = await json.decode(response.body);
    /* Default Decode Type Is List Dynamic, And Below Convert That Type To List Int */
    // List<int> toListInt = List<int>.from(id);
    /* Convert List Int To Future List Int To Fit With Function Type*/
    // Future<List<int>> listInt = new Future<List<int>>(() => toListInt );
    return id;
  }
  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}