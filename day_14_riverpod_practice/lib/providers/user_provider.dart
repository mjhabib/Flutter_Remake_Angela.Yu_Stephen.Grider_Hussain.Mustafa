import 'package:flutter_riverpod/flutter_riverpod.dart';

const users = {1: 'Alice', 2: 'Bob', 3: 'Charlie'};

// with Provider.family we can pass an input to our provider and get a different output
final userProvider = Provider.family<String, int>((ref, userId) {
  return users[userId] ?? 'Unknown';
});

// There is a concept called 'autoDispose' in Riverpod and it basically means if no-one (widget) is using (listening) to that provider, then Riverpod will dispose it to save memory.
// One example is when we use Navigator.pop() to close a screen, which means as soon as we leave that page, the provider no longer listens to changes.
// If we open that page/screen again, then the Provider will create a new instance again.
// Depend on the app, the tradeoff is:
// -> Memory usage or
// -> Recomputing data
// Here's how to use 'autoDispose' in the same provider:
final userProvider2 = Provider.autoDispose.family<String, int>((ref, userId) {
  return users[userId] ?? 'Unknown';
});
