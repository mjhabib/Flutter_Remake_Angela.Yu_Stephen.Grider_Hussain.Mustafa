import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/2_1_synchronous_notifier_provider/counter_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: CounterScreen())));
}

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state value to trigger UI rebuilds when it changes
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('2.1: Synchronous Custom State (NotifierProvider)'),
      ),
      body: Center(child: Text('$count', style: const TextStyle(fontSize: 48))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'dec',
            // Use ref.read(.notifier) to call specific methods on your class without watching it
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'inc',
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
