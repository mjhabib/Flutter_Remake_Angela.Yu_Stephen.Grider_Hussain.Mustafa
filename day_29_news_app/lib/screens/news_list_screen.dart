import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_tile.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: NewsListTile(),
    );
  }
}
