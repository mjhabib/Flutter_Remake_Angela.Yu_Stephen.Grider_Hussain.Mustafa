import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_user_data_provider.g.dart';

/* This pattern is used to handle network requests, database fetches, or any asynchronous, one-time calculation. Returning a Future automatically creates an asynchronous data pipeline. In the UI, the state is wrapped in an AsyncValue, which gives you safe, built-in loading and error handling loops. */
// Returning a Future makes the generator treat this as a FutureProvider.
// This function name generates "fetchUserDataProvider".
@riverpod
Future<String> fetchUserData(Ref ref) async {
  // Simulate a network latency delay
  await Future.delayed(const Duration(seconds: 5));

  return 'User Profile: MJ Habib';
}
