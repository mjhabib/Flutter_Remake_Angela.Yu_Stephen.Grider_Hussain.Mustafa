import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/4_1_data_retention/toggle_theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appSettingsProvider);

    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson 4.1: Data Retention (keepAlive / Offline Caching)',
        ),
      ),
      body: Center(
        child: SwitchListTile(
          title: const Text('Enable Dark Mode'),
          value: isDarkMode,
          // State persists globally across the entire app lifecycle
          onChanged: (bool value) {
            ref.read(appSettingsProvider.notifier).toggleTheme();
          },
        ),
      ),
    );
  }
}
