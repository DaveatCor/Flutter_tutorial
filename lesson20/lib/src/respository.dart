import 'dart:io';
import 'new_db_provider/new_db_provider.dart';
import 'source/new_api_provider.dart';
import 'model/model.dart';

class Respository {
  NewsApiProvider newsApiProvider = NewsApiProvider();
  NewsDbProvider newsDbProvider = NewsDbProvider();

  fetchTopIds() {

  }
  
  fetchItem(int id) async {
    var item = await newsDbProvider.fetchItem(id); 
    if ( item != null ) {
      return item;
    }

    item = await newsApiProvider.fetchItem(id);
    newsDbProvider.addItem(item);
    return item;
  }
}