import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/1_3_asynchronous_stream_provider/status_updates_provider.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: StreamScreen())));
}

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Exposes an AsyncValue<int> that updates automatically as the stream emits new values
    final asyncCount = ref.watch(statusUpdatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1.3: Asynchronous Streams (StreamProvider)'),
      ),
      body: Center(
        child: asyncCount.when(
          // Runs every single time the stream yields a new value
          data: (count) => Text(
            'Current Count: $count',
            style: const TextStyle(fontSize: 26),
          ),

          // Triggers while waiting for the stream to emit its very first item
          loading: () => const CircularProgressIndicator(),

          // Catches errors thrown inside the stream loop
          error: (error, stackTrace) => Text('Stream error: $error'),
          /* The stackTrace is a detailed logs map showing the exact path the code took right up until it crashed (the line number, the file, and the sequence of function calls). While you might only display the error message to the user, you pass stackTrace along so developers can print it to the console to debug exactly where and why the failure happened. */
        ),
      ),
    );
  }
}
