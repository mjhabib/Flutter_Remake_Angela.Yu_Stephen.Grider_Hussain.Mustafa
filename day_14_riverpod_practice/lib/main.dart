import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_practice/providers/app_provider.dart';
import 'package:riverpod_practice/widgets/counter_button.dart';

void main() {
  // 1. ProviderScope (the manager) keeps track of all the providers.
  runApp(ProviderScope(child: const MainApp()));
}

// 2. Only widgets that interact with providers need to become 'ConsumerWidgets'.
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  // 3. 'ref' acts like my "remote control" for interacting with providers
  Widget build(BuildContext context, WidgetRef ref) {
    // 4. 'watch' is like: Keep your eye on this provider. If anything changes, tell me (automatically rebuild this widget).
    // So 'watch' has two jobs:
    // A. It gets the current value.
    // B. It subscribes the widget to future changes.

    // We can also use 'read' for widgets we don't want to rebuild (like a counter widget), so:
    // A. It does not subscribe.
    // B. It does not rebuild the widget.
    // C. It simply reads the value once.
    final myAppName = ref.watch(appNameProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(myAppName)),
        body: Center(child: CounterButton()),
      ),
    );
  }
}

// ======================= Riverpod Cheat Sheet =======================
//
// ref.watch(provider)
// - Read the provider's state.
// - Rebuilds when the state changes.
// - Used for displaying data in the UI.
//
// ref.read(provider)
// - Reads the current value once.
// - Does NOT rebuild.
// - Used for one-time actions.
//
// ref.read(provider.notifier)
// - Gets the notifier object.
// - Used to call methods that change the state.
//
// ref.listen(provider)
// - Reacts to state changes.
// - Does NOT rebuild the UI.
// - Used for side effects (SnackBars, dialogs, navigation, etc.).
//
// ====================================================================
