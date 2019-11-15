import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final bool dead;
  final String parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parse) 
    : id = parse['id'],
      deleted = parse['deleted'],
      type = parse['type'],
      by = parse['by'],
      time = parse['time'],
      dead = parse['dead'],
      parent = parse['parent'],
      kids = parse['kids'],
      url = parse['url'],
      score = parse['score'],
      title = parse['title'],
      descendants = parse['descendants'];

  ItemModel.fromDb(Map<String, dynamic> parse) 
    : id = parse['id'],
      deleted = parse['deleted'] == 1,
      type = parse['type'],
      by = parse['by'],
      time = parse['time'],
      dead = parse['dead'] == 1,
      parent = parse['parent'],
      kids = jsonDecode(parse['kids']),
      url = parse['url'],
      score = parse['score'],
      title = parse['title'],
      descendants = parse['descendants'];

  toMap() {
    return <String, dynamic> {
      "id" : id,
      "deleted" : deleted ? 1 : 0,
      "type" : type,
      "by" : by,
      "time" : time,
      "dead" : dead ? 1 : 0,
      "parent" : parent,
      "kids" : jsonEncode(kids),
      "url" : url,
      "score" : score,
      "title" : title,
      "descendants" : descendants
    };
  }

  List<int> listId(Future<List<int>> listIds) {
    List<int> ids = [];
    listIds.then((value){
      print(value);
    });
  }
    
}