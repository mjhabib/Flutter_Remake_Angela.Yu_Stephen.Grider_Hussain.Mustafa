import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/1_2_asynchronous_future_provider/fetch_user_data_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: DataScreen())));
}

class DataScreen extends ConsumerWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch here exposes an AsyncValue<String> instead of a raw String
    final asyncUserData = ref.watch(fetchUserDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson 1.2: Asynchronous One-Time Tasks (FutureProvider)',
        ),
      ),
      body: Center(
        child: asyncUserData.when(
          // Triggers when the Future completes successfully
          data: (data) => Text(data, style: const TextStyle(fontSize: 22)),

          // Triggers while the Future is pending resolution
          loading: () => const CircularProgressIndicator(),

          // Triggers if the Future throws an exception
          error: (error, stackTrace) => Text('Something went wrong: $error'),
        ),
      ),
    );
  }
}
