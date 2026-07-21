import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/stories_provider.dart';

class NewsListScreen extends ConsumerWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesAsync = ref.watch(storiesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: buildList(storiesAsync),
    );
  }

  Widget buildList(AsyncValue<List<int>> storiesAsync) {
    return storiesAsync.when(
      data: (ids) => ListView.builder(
        itemCount: ids.length,
        itemBuilder: (context, index) => Text('ID: ${ids[index]}'),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }

  /* When working with Riverpod, sticking to ref.watch(storiesProvider) and using .when() (or pattern matching) is the idiomatic standard for several reasons:
  - Riverpod Already Manages Stream State: Riverpod automatically listens to your async* stream behind the scenes and converts incoming yields into an AsyncValue (AsyncLoading, AsyncData, or AsyncError).
  - Built-in Caching and Memory Safety: Standard Flutter StreamBuilder widgets subscribe and unsubscribe every time the widget rebuilds if not carefully cached. Riverpod handles stream subscriptions at the provider level, so your UI won't accidentally restart the stream on simple widget rebuilds.
  - Cleaner Syntax: .when() forces you to handle loading, error, and data states explicitly, keeping UI code clean without checking snapshot.hasData or snapshot.hasError manually. */
}
