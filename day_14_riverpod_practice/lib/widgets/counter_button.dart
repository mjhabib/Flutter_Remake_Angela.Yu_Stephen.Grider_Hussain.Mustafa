import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_practice/providers/counter_provider.dart';

class CounterButton extends ConsumerWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // A: counterProvider → "What's the current value?"
    final counter = ref.watch(counterProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(counter.toString(), style: TextStyle(fontSize: 30)),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // B: counterProvider.notifier → "Give me the object that can change the value."
            ref.read(counterProvider.notifier).increment();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

// C: We can use 'listen()' when we don't want to rebuild the entire screen (UI/Widgets) just because we wanna show something like a 'SnackBar' in this example.
// We use 'listen' to react to the change because it does not return anything:

// ref.listen(counterProvider, (previous, next) {
//   if (next == 10) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Congratulation, you reached 10!'),
//       ),
//     );
//   }
// });
