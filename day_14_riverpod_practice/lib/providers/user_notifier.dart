import 'package:flutter_riverpod/flutter_riverpod.dart';

// AsyncNotifier (Super useful & Important). Because it can:
// A. change state
// B. and supports async
// Ex: It a real flutter app it's perfect for: Login, Registration, Fetching a profile, Refreshing a feed, Loading comments, Updating settings, Uploading a profile picture, etc...

// Step 1. Creating an AsyncNotifier:
class UserNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    await Future.delayed(Duration(seconds: 2));
    return 'MJ';
  }

  // Step 3. other things, like adding a refresh method with error handling
  // Future<void> refresh() async {
  //   state = const AsyncLoading();

  //   try {
  //     final user = await fetchUser();
  //     state = AsyncData(user);

  //   } catch (e, st) {
  //     state = AsyncError(e, st);
  //   }
  // }
}

// Step 2. Creating the provider:
final userNotifier = AsyncNotifierProvider<UserNotifier, String>(
  UserNotifier.new,
);

// Step 4. In a widget/UI: final user = ref.watch(userProvider);
// Then it will return "AsyncValue<String>"

// Then, in a button:
// ElevatedButton(
//   onPressed: () {
//     ref
//       .read(userProvider.notifier)
//       .refresh();
//   },
//   child: const Text("Refresh"),
// )



// -------------------------------------------------------------------------------------------

// Comparing the Four Main Providers


// | Provider Type           | Mutable | Async | Common Use                                          |
// | ----------------------- | :-----: | :---: | --------------------------------------------------- |
// | `Provider`              |    ❌    |   ❌   | Configuration, repositories, services            |
// | `NotifierProvider`      |    ✅    |   ❌   | Counter, theme, cart, local state                |
// | `FutureProvider`        |    ❌    |   ✅   | Read-only API call                               |
// | `AsyncNotifierProvider` |    ✅    |   ✅   | Login, profile, CRUD operations, refreshing data |



// ======================= Separation of Responsibilities =======================
//
// UI (Widgets)
// - Displays data.
// - Handles user input.
// - Watches providers and calls notifier methods.
// - Should NOT contain business logic or HTTP requests.
//
// Notifier (Notifier / AsyncNotifier)
// - Manages the state.
// - Contains business logic.
// - Calls repositories to perform work.
// - Exposes methods like login(), refresh(), addTodo(), etc.
// - Should NOT know about HTTP, JSON parsing, or database details.
//
// Repository
// - Acts as the single source of truth for data.
// - Decides where data comes from (API, database, cache, etc.).
// - Hides implementation details from the notifier.
//
// API / Service
// - Talks directly to external services (REST, GraphQL, Firebase, etc.).
// - Makes HTTP requests.
// - Parses responses into models.
// - Has no knowledge of Riverpod or the UI.
//
// Dependency Flow:
//
// UI
//  ↓
// Notifier
//  ↓
// Repository
//  ↓
// API / Service
//  ↓
// Internet / Database
//
// Rule of Thumb:
// - Widgets display data.
// - Notifiers manage state and business logic.
// - Repositories manage data sources.
// - Services communicate with external systems.
// ============================================================================