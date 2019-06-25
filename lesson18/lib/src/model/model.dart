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

}