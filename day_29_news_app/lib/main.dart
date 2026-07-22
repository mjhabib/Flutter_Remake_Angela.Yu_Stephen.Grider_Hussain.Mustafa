import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/screens/news_list_screen.dart';
import 'package:news_app/screens/comment_list_screen.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => NewsListScreen());
        } else {
          return MaterialPageRoute(
            builder: (context) {
              final itemId = int.parse(settings.name!);
              return CommentListScreen(itemId: itemId);
            },
          );
        }
      },
    );
  }
}
