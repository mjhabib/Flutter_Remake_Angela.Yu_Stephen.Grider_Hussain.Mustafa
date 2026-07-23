import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/stories_provider.dart';
import 'package:news_app/widgets/comment_list_tile.dart';

class CommentListScreen extends ConsumerWidget {
  final int itemId;
  const CommentListScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyAsync = ref.watch(storyProvider(itemId));

    return Scaffold(
      appBar: AppBar(title: Text('Top Comments')),
      body: storyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
        data: (story) {
          if (story == null) {
            return const Center(child: Text('Story not found'));
          }

          final kids = story.kids;

          if (kids.isEmpty) {
            return const Center(child: Text('No comments yet'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(storyProvider);
              await ref.read(storyProvider(itemId).future);
            },
            child: ListView.builder(
              itemCount: kids.length,
              itemBuilder: (context, index) {
                return CommentListTile(commentId: kids[index], depth: 0);
              },
            ),
          );
        },
      ),
    );
  }
}
