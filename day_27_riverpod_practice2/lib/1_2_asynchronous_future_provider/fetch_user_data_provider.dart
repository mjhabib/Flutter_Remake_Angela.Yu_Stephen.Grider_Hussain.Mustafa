import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_user_data_provider.g.dart';

// Returning a Future makes the generator treat this as a FutureProvider.
// This function name generates "fetchUserDataProvider".
@riverpod
Future<String> fetchUserData(Ref ref) async {
  // Simulate a network latency delay
  await Future.delayed(const Duration(seconds: 5));

  return 'User Profile: MJ Habib';
}
