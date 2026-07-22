// this new repository is designed to expand or refactor based on our needs in the future
// for example if someday we decided to expand this class and offer some other type of provider like cache, we can do so by using the abstract classes we implemented

// IMPORTANT: Since our DB doesn't work on Web, we commented all DB related codes to prevent error

import 'package:news_app/models/item_model.dart';
import 'package:news_app/resources/news_api_provider.dart';
// import 'package:news_app/resources/news_db_provider.dart';

class RepositoryNew {
  // we're directly using an instance of the NewsDbProvider() class here to prevent creating multiple instances
  List<Source> sources = [NewsApiProvider()];
  // List<Source> sources = [newsDbProvider, NewsApiProvider()];
  // List<Cache> caches = [newsDbProvider];

  Future<List<dynamic>> fetchTopIds() {
    // Iterate over sources when DbProvider get fetchTopIds implemented
    return sources[0].fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async {
    ItemModel? item;
    // var source;

    // for (source in sources) {
    //   item = await source.fetchItem(id);
    //   if (item != null) {
    //     // if we found the item, do not iterate other sources
    //     break;
    //   }
    // }

    item = await sources[0].fetchItem(id);

    // for (var cache in caches) {
    //   if (cache != source) {
    //     cache.addItem(item);
    //   }
    // }

    return item;
  }

  // Delete old caches
  // void clearCache() async {
  //   for (var cache in caches) {
  //     await cache.clear();
  //   }
  // }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
  Future<int> clear();
}
