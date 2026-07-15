import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: EmailValidatorScreen());
  }
}

class EmailValidatorScreen extends StatefulWidget {
  const EmailValidatorScreen({super.key});

  @override
  State<EmailValidatorScreen> createState() => _EmailValidatorScreenState();
}

class _EmailValidatorScreenState extends State<EmailValidatorScreen> {
  // A StreamController acts like a pipeline.
  // Whenever the user types something,
  // we'll send the new text into this controller.
  final emailController = StreamController<String>();

  String? errorText;

  @override
  void initState() {
    super.initState();

    // Listen for every new email the user types.
    emailController.stream.listen((email) {
      setState(() {
        // Very simple validation.
        if (email.contains('@')) {
          errorText = null;
        } else {
          errorText = 'Email must contain @';
        }
      });
    });
  }

  @override
  void dispose() {
    emailController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Validation Example')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(labelText: 'Email', errorText: errorText),

          // Every keystroke creates a new event.
          onChanged: (text) {
            // Send the new text into the stream.
            emailController.sink.add(text);
          },
        ),
      ),
    );
  }
}
