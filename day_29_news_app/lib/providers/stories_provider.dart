import 'package:news_app/resources/repository_new.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stories_provider.g.dart';

@riverpod
class Stories extends _$Stories {
  final RepositoryNew _repository = RepositoryNew();

  @override
  Stream<List<int>> build() async* {
    final List<int> topIds = [];

    // Fetch the list of IDs
    final ids = await _repository.fetchTopIds();

    // Loop through them and yield an updated list after each step
    for (final id in ids) {
      topIds.add(id);

      // Yielding a new list copy updates the UI instantly for each item!
      yield [...topIds];
      // yield List.unmodifiable(topIds);

      /* Both List.unmodifiable(topIds) and [...topIds] achieve the core rule of state management in Flutter: Never mutate existing state objects; always emit a fresh copy! */
    }
  }
}
