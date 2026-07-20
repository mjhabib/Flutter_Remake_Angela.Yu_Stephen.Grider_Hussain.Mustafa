import 'dart:io'; // Directory
import 'package:path/path.dart'; // join()
import 'package:sqflite/sqflite.dart'; // Database
import 'package:path_provider/path_provider.dart'; // getApplicationDocumentsDirectory()
import 'package:news_app/models/item_model.dart'; // ItemModel.fromDb()

// unfortunately sqflite package only works on mobile, so I can not test it on web but for future projects I can use alternative packages like hive.
class NewsDbProvider {
  Database? db;

  // since our initializer/constructor can't be async we are gonna create a method called init to do all pre-initializing things before we move to the implementing other functionalities
  void init() async {
    // device's path to create a DB and save data
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'items.db');

    // open the DB if exists, if not, create one
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (newDB, version) {
        // triple quotations allow us to create multi-line strings
        newDB.execute("""
          CREATE TABLE Items
            (
              id INTEGER PRIMARY KEY,
              deleted INTEGER,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              dead INTEGER,
              parent INTEGER,
              kids BLOB,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
        """);
      },
    );
  }

  Future<ItemModel?> fetchItem(int id) async {
    // tableName: Items
    // columns: to get a specific column
    // where: it's basically the search query which means find all the items with the id of '?'
    // whereArgs: the '?' we pass on will be replaced here (to prevent sql-injection attack)
    final maps = await db!.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  // we don't care about awaiting for this method that's why we didn't turn it to async
  Future<int> addItem(ItemModel item) {
    return db!.insert('Items', item.toMapForDb());
  }
}
