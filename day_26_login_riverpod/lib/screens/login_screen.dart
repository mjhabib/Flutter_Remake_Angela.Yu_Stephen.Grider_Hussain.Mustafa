import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:login_riverpod/providers/validation_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginValidationProvider);

    return Container(
      margin: EdgeInsets.all(20),
      // we didn't use a Form here because in the old app it acted as a stateful-widget, but now that we're using a provider like riverpod, it can be ignored
      child: Column(
        children: [
          emailField(ref),
          SizedBox(height: 10),
          passwordField(ref),
          SizedBox(height: 20),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(WidgetRef ref) {
    return StreamBuilder(
      // Validate the email
      stream: ref.read(loginValidationProvider.notifier).validatedEmailStream,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@email.com',
            labelText: 'Email:',
            errorText: snapshot.hasError ? snapshot.error as String : null,
          ),

          // Send new email into the stream
          onChanged: (value) {
            ref.read(loginValidationProvider.notifier).updateEmail(value);
          },
        );
      },
    );
  }

  Widget passwordField(WidgetRef ref) {
    return StreamBuilder(
      // Validate the password
      stream: ref
          .read(loginValidationProvider.notifier)
          .validatedPasswordStream,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'abc123',
            labelText: 'Password:',
            errorText: snapshot.hasError ? snapshot.error as String : null,
          ),

          // Send new password into the stream
          onChanged: (value) {
            ref.read(loginValidationProvider.notifier).updatePassword(value);
          },
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Submit'));
  }
}
