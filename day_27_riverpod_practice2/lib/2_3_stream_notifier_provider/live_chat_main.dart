import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/2_3_stream_notifier_provider/live_chat_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: ChatScreen())));
}

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Exposes an AsyncValue<List<String>> fed by the custom stream controller
    final asyncMessages = ref.watch(liveChatProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson 2.3: Stream Custom State (StreamNotifierProvider)',
        ),
      ),
      body: asyncMessages.when(
        data: (messages) => ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(messages[index])),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Stream Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(liveChatProvider.notifier)
              .sendNewMessage('MJ: This is a new message!');
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}

/* Why ListView.builder instead of StreamBuilder?
You use a StreamBuilder when you are listening to a raw Dart Stream directly inside the UI. However, Riverpod intercepting the stream completely removes that need! Riverpod converts the stream into an AsyncValue<List<String>>. By the time the data reaches your widget tree, it is already a plain, unpacked Dart List<String>. Therefore, you just use a regular ListView.builder to display the list items. */
