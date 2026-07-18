import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_provider.g.dart';

/* This pattern is used when your mutable state manager (a class-based notifier) needs external configurations or specific data IDs to initialize its state—for instance, managing a user profile screen where the layout changes depending on the logged-in user's identity.
With Riverpod code generation, you pass extra arguments straight into the notifier's class build() method. The generator automatically handles the underlying mapping infrastructure, creating a custom constructor parameter you can pass directly when calling .notifier or watching the provider from your UI. */

// Generates "userProfileProvider" which accepts a custom positional String argument
@riverpod
class UserProfile extends _$UserProfile {
  // Arguments are defined directly inside the build method signature
  @override
  String build(String userId) {
    // Initialize state dynamically based on the parameter received
    return 'User ID $userId: Profile Active';
  }

  // Custom mutation methods can access the parameter using "this.userId"
  void updateUsername(String newName) {
    state = 'User ID $userId: $newName';
  }
}
