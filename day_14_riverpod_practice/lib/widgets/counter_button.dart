import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_practice/providers/counter_provider.dart';

// Since a 'ConsumerWidget' is stateless and its build() method can be called many times (we could accidentally show the SnackBar multiple times), so it's not reasonable to put our listener inside this class, that's why we need to convert it to a 'ConsumerStatefulWidget', which means now we have access to methods like initState() and dispose() which has a lifecycle (and runs only once).
class CounterButton extends ConsumerStatefulWidget {
  const CounterButton({super.key});

  @override
  ConsumerState<CounterButton> createState() => _CounterButtonState();
}

// 'ConsumerState' will gives us access to 'ref' everywhere in the state class.
class _CounterButtonState extends ConsumerState<CounterButton> {
  // Now that we have access to the initState() and we know it only runs once, now we can put our listener inside it.
  @override
  void initState() {
    super.initState();
    // In Riverpod 3.x or above we should replace listen() with listenManual() inside lifecycle widgets like this, because listenManual() creates a listener that lives outside the widget build process and Riverpod manages its lifecycle for us.
    ref.listenManual(counterProvider, (previous, next) {
      if (next == 10 || next == 20) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Congratulation, you pressed the add button 10 times!',
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
