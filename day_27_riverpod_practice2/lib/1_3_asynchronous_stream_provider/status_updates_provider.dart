import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_updates_provider.g.dart';

/* This pattern is used to handle real-time data pipelines that emit multiple updates over time—such as listening to a chat room database, tracking a user's live GPS location, or handling web sockets.
Just like a FutureProvider, the UI receives the emitted data wrapped in an AsyncValue to seamlessly handle loading and error cycles. */

// Returning a Stream automatically tells the generator to set up a StreamProvider.
// This function name generates "statusUpdatesProvider".
@riverpod
Stream<int> statusUpdates(Ref ref) async* {
  /* In simple terms, async returns a single value in the future (like a delivery box arriving once). async* creates a generator that streams a continuous flow of values over time (like a water faucet running until you turn it off). */
  int counter = 0;

  // Continuously emit an incremented number every 1 second
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield counter++;
    /* In an async* function, yield is the keyword that actually pushes the value out into the stream pipeline so the UI can hear it. Without yield, the number increases privately inside the function, but nothing ever gets sent to your widgets. */
  }
}
