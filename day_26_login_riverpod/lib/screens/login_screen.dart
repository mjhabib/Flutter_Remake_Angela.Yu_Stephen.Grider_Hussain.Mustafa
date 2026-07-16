import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // we didn't use a Form here because in the old app it acted as a stateful-widget, but now that we're using a provider like riverpod, it can be ignored
      child: Column(
        children: [
          emailField(),
          SizedBox(height: 10),
          passwordField(),
          SizedBox(height: 20),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@email.com',
        labelText: 'Email:',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'abc123', labelText: 'Password:'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Submit'));
  }
}
