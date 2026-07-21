import 'package:news_app/models/item_model.dart';
import 'package:news_app/resources/repository_new.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stories_provider.g.dart';

final _repository = RepositoryNew();

// Downloads IDs only once
@riverpod
Future<List<int>> topStoryIds(Ref ref) async {
  final ids = await _repository.fetchTopIds();
  return ids.cast<int>();
}

// family:
// Every ID has its own provider and Riverpod automatically caches them.
@riverpod
Future<ItemModel?> story(Ref ref, int id) {
  return _repository.fetchItem(id);
}
