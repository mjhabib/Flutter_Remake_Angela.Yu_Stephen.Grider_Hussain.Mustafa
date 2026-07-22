import 'package:flutter/material.dart';

class CommentListScreen extends StatelessWidget {
  final int itemId;
  const CommentListScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Comments')),
      body: Text('$itemId'),
    );
  }
}
