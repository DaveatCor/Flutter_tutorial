import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:lesson20/src/model/model.dart';

class NewsDbProvider{
  Database db;
  init() async {
    /* Reference to directory or fileSystem on mobile devices*/
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db"); 
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version){
        /* Items below is a name of Database */
        /* BLOB is a big set of data */
        /* Sequel lite doesn't have boolean type but we can assign variable as integer and 0 == false, 1 == true */
        newDb.execute("""
          CREATE TABLE Items(
            id INTEGER PRIMARY KEY,
            deleted INTEGER,
            type TEXT,
            by TEXT,
            time INTEGER,
            dead INTEGER,
            parent TEXT,
            kids BLOB,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        """);
      }
    );
  }

  fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      /* Where is a query class that specify actual search */
      where: "id = ?", /* The question mark is get parameter from id and will replace whereArgs list */
      whereArgs: [id] /* WhereArges is declare for prevent SQL Injection (SQL Injection Attack) */
    );

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  addItem(ItemModel model) {
    db.insert("Items", model.toMap());
  }
}