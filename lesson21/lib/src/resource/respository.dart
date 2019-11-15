import 'dart:io';
import 'new_db_provider.dart';
import 'new_api_provider.dart';
import 'package:lesson21/src/model/model.dart';

class Respository {
  
  List<Source> sources = <Source> [
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache> [
    newsDbProvider
  ];

  Future<List<int>> fetchTopIds() {
    return null;
  }
  
  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;
    int i = 1;

    for (source in sources ){
      item = await source.fetchItem(id);
      
      /* If Have Data Break Loop */
      if ( item != null ) {
        print(item);
        print(i);
        break;
      }
      i++;
    }

    for (var cache in caches){
      cache.addItem(item);
    }

    return item;
    // var item = await newsDbProvider.fetchItem(id); 
    // if ( item != null ) {
    //   return item;
    // }

    // item = await newsApiProvider.fetchItem(id);
    // newsDbProvider.addItem(item);
    // return item;
  }

}
abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
 Future<ItemModel> addItem(ItemModel item);
}