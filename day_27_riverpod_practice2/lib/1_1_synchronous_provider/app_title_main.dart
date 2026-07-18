import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/1_1_synchronous_provider/app_title_provider.dart';

void main() {
  runApp(
    // The ProviderScope widget must wrap the root of the application
    const ProviderScope(child: MaterialApp(home: HomeScreen())),
  );
}

// Inherit from ConsumerWidget instead of StatelessWidget to gain access to WidgetRef
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch listens to the generated provider for changes and reads its current value
    final title = ref.watch(appTitleProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lesson 1.1')),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 24))),
    );
  }
}
