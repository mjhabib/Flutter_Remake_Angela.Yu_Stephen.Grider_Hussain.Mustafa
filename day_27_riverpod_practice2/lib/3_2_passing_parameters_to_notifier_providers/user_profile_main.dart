import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/3_2_passing_parameters_to_notifier_providers/user_profile_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: AdminPanelScreen())));
}

class AdminPanelScreen extends ConsumerWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pass the required parameter inside the execution parentheses of the provider
    final profileAlice = ref.watch(userProfileProvider('alice_123'));
    final profileBob = ref.watch(userProfileProvider('bob_999'));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson 3.2: Passing Parameters to Notifier Providers',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(profileAlice),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Pass the argument to both the provider and the notifier call
                  ref
                      .read(userProfileProvider('alice_123').notifier)
                      .updateUsername('Alice Smith');
                },
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(profileBob),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  ref
                      .read(userProfileProvider('bob_999').notifier)
                      .updateUsername('Bob Jones');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
