import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news_app/utility/format_time.dart';
import 'package:news_app/widgets/loading_container.dart';
import 'package:news_app/providers/stories_provider.dart';

class CommentListTile extends ConsumerWidget {
  const CommentListTile({
    super.key,
    required this.commentId,
    required this.depth,
  });

  // The id of this comment to download.
  final int commentId;

  // Used only to indent replies.
  // Top-level comments have depth = 0.
  // Their replies have depth = 1, then 2, etc.
  final int depth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Download this specific comment.
    final commentAsync = ref.watch(storyProvider(commentId));
    final unescape = HtmlUnescape();

    return commentAsync.when(
      loading: () =>
          const Padding(padding: EdgeInsets.all(8), child: LoadingContainer()),

      error: (e, s) =>
          Padding(padding: const EdgeInsets.all(8), child: Text('Error: $e')),

      data: (comment) {
        if (comment == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          // Indent every reply a little more than its parent.
          padding: EdgeInsets.only(
            left: depth * 20.0,
            right: 8,
            top: 8,
            bottom: 8,
          ),

          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        comment.by,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        formatTime(comment.time),
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Instead of a Text widget use Html to convert the html tags to readable comments and clean/unescape the HTML-encoded comments
                  Html(data: unescape.convert(comment.text)),

                  const SizedBox(height: 8),

                  // --------------------------------------------------------
                  // Every Hacker News comment may have replies.
                  //
                  // Those replies are stored inside "kids".
                  //
                  // Example:
                  //
                  // Comment A
                  //    ├── Reply B
                  //    ├── Reply C
                  //    └── Reply D
                  //
                  // comment.kids = [12, 34, 56]
                  //
                  // We DON'T manually download these replies here.
                  //
                  // Instead, for every child id we simply create another
                  // CommentListTile.
                  //
                  // That new CommentListTile watches storyProvider(childId),
                  // downloads itself, displays itself, and if it has replies,
                  // creates MORE CommentListTiles.
                  //
                  // This technique is called RECURSION.
                  //
                  // The process automatically stops when a comment has no
                  // children (kids is empty or null).
                  // --------------------------------------------------------
                  if (comment.kids.isNotEmpty)
                    ...comment.kids.map(
                      (childId) =>
                          CommentListTile(commentId: childId, depth: depth + 1),
                      // Increase depth so replies appear indented.
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/*
RECURSION EXAMPLE

Story
 ├── Comment #1
 │      ├── Reply #1
 │      │      ├── Reply
 │      │      └── Reply
 │      │
 │      └── Reply #2
 │
 └── Comment #2
        └── Reply

The UI doesn't know how many levels of replies exist.

Instead, every CommentListTile builds MORE CommentListTiles
for its children.

CommentListTile
    ↓
downloads comment
    ↓
shows comment
    ↓
has children?
    ↓
yes
    ↓
create more CommentListTiles
    ↓
repeat...

The recursion ends naturally when a comment has no children.
*/
