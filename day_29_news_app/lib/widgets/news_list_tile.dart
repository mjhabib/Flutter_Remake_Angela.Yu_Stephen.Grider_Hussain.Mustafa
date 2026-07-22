import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/stories_provider.dart';
import 'package:news_app/widgets/loading_container.dart';

class NewsListTile extends ConsumerWidget {
  const NewsListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(topStoryIdsProvider);

    return idsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
      data: (ids) {
        return RefreshIndicator(
          onRefresh: () async {
            // Throw away the old data and compute it again.
            ref.invalidate(topStoryIdsProvider);

            // Event handlers usually use read(), because they don't need rebuilding
            // And it returns: Future<List<int>> NOT AsyncValue<List<int>>
            // so we don't have to manually update it or re-assign it to a variable
            await ref.read(topStoryIdsProvider.future);
          },

          child: ListView.builder(
            itemCount: ids.length,
            itemBuilder: (context, index) {
              final storyAsync = ref.watch(storyProvider(ids[index]));

              return storyAsync.when(
                loading: () => const LoadingContainer(),
                error: (e, s) => ListTile(title: Text('Error: $e')),
                data: (story) {
                  if (story == null) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: [
                      ListTile(
                        title: Text(story.title),
                        subtitle: Text(
                          '${story.score} points • By ${story.by}',
                        ),
                        trailing: Column(
                          children: [
                            Icon(Icons.comment),
                            Text('${story.descendants}'),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

/*
WHY THIS APPROACH?

The Hacker News API first returns a list of story IDs, then each story must be
requested individually. Instead of fetching every story immediately, the app
uses two Riverpod providers:

1. topStoryIdsProvider
   - Fetches the list of IDs once.

2. storyProvider(id)
   - Fetches a single story for a given ID.

The UI uses ListView.builder, which is lazy. Flutter only builds the widgets
currently visible on the screen, so only those stories are requested. As the
user scrolls, more StoryTiles are built and their corresponding providers
fetch the additional stories.

Why is this better than a StreamBuilder?

A StreamBuilder would typically fetch story #1, emit it, fetch story #2, emit
it, and continue until all 500 stories are downloaded. Even if the user only
reads the first 10 stories, the remaining 490 requests would still happen,
wasting network bandwidth, battery, and API calls.

With ListView.builder + Riverpod family providers:
- Only visible stories are fetched.
- Stories are fetched on demand as the user scrolls.
- Each story has its own cached provider.
- Scrolling back to a previously viewed story usually doesn't trigger another
  HTTP request because Riverpod already has it in memory.

This approach is more scalable, more efficient, and fits Flutter's lazy UI
building model.
*/
