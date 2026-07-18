import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'live_chat_provider.g.dart';

/* This pattern is used when your mutable state relies on a live, continuous data stream (like a WebSocket connection or live chat updates) but still needs custom methods inside the provider to dynamically alter or manually manipulate the state from the UI.
By returning a Stream in the build() method, Riverpod turns the state into an AsyncValue that auto-updates whenever the stream emits new values. */

// Generates "liveChatProvider"
@riverpod
class LiveChat extends _$LiveChat {
  // A controller allows us to manually add data to the stream path later
  final StreamController<List<String>> _chatController =
      StreamController<List<String>>();
  final List<String> _messages = ['System: Welcome to Live Chat!'];

  // The build method initializes the state as a continuous stream
  @override
  Stream<List<String>> build() async* {
    // Emit our baseline messages list right away
    _chatController.add([..._messages]); // Send a copy of the initial list

    // Yield the controller stream so Riverpod can listen to it continuously
    yield* _chatController.stream;
  }

  // Add custom mutation methods to manipulate the underlying stream data
  void sendNewMessage(String text) {
    _messages.add(text);
    // Push the updated array down the stream pipeline to notify listeners
    // Using [..._messages] syntax instead of _messages, passes a brand new list instance so Riverpod sees the change
    _chatController.add([..._messages]);
  }
}
