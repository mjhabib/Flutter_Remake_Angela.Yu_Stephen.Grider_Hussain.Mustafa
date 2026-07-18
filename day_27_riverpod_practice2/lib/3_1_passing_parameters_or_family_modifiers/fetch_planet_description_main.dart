import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/3_1_passing_parameters_or_family_modifiers/fetch_planet_description_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: SpaceScreen())));
}

class SpaceScreen extends ConsumerWidget {
  const SpaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pass the required parameter directly inside the provider's execution parenthesis
    final asyncMarsData = ref.watch(fetchPlanetDescriptionProvider('Mars'));
    final asyncJupiterData = ref.watch(
      fetchPlanetDescriptionProvider('Jupiter'),
    );

    // Purposely pass an unknown data!
    final asyncUnknownData = ref.watch(
      fetchPlanetDescriptionProvider('Unknown'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson 3.1: Passing Parameters to Functional Providers (Family)',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mars Planet:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            asyncMarsData.when(
              data: (text) => Text(text),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Jupiter Planet:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            asyncJupiterData.when(
              data: (text) => Text(text),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Unknown Planet:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            asyncUnknownData.when(
              data: (text) => Text(text),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
          ],
        ),
      ),
    );
  }
}
