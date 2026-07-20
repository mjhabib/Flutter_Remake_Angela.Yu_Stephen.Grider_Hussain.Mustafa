import 'package:news_app/models/item_model.dart';
import 'package:news_app/resources/news_api_provider.dart';
import 'package:news_app/resources/news_db_provider.dart';

class RepositoryOld {
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsDbProvider dbProvider = NewsDbProvider();

  Future<List<dynamic>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    // check to see if data exists in the DB or not
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }

    // if we didn't find any data in the DB, we fetch it using an API call
    item = await apiProvider.fetchItem(id);

    // then we save it to the DB for the future calls
    dbProvider.addItem(item);

    // now that we know we have data, we can return it
    return item;
  }
}
