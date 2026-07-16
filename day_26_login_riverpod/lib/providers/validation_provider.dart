import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'validation_provider.g.dart';

@riverpod
class LoginValidation extends _$LoginValidation {
  //──────────────────────────────────────────────
  // Controllers
  //──────────────────────────────────────────────

  // Receive raw text entered by the user.
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  @override
  void build() {
    // Riverpod automatically calls this when the provider is destroyed.
    ref.onDispose(() {
      _emailController.close();
      _passwordController.close();
    });
  }

  //──────────────────────────────────────────────
  // Transformers
  //──────────────────────────────────────────────

  // Validate an email.
  static final _validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Please enter a valid email.');
      }
    },
  );

  // Validate a password.
  static final _validatePassword =
      StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink) {
          if (password.length >= 6) {
            sink.add(password);
          } else {
            sink.addError('Password must contain at least 6 characters.');
          }
        },
      );

  //──────────────────────────────────────────────
  // Output streams
  //──────────────────────────────────────────────

  // Widgets listen to these streams.
  late final Stream<String> validatedEmailStream = _emailController.stream
      .transform(_validateEmail);

  late final Stream<String> validatedPasswordStream = _passwordController.stream
      .transform(_validatePassword);

  //──────────────────────────────────────────────
  // Input methods
  //──────────────────────────────────────────────

  // Send new text into the stream.
  void updateEmail(String email) {
    _emailController.add(email);
  }

  void updatePassword(String password) {
    _passwordController.add(password);
  }
}
