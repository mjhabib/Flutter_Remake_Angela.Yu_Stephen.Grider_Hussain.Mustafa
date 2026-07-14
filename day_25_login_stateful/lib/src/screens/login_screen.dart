import 'package:flutter/material.dart';
import 'package:virtual_keypad/virtual_keypad.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailField(),
            SizedBox(height: 20),
            passwordField(),
            SizedBox(height: 20),
            submitButton(),
            SizedBox(height: 10),
            VirtualKeypad(
              standalone: true,
              initialLanguage: 'en',
              availableLanguages: ['en', 'ar'],
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      autofocus: true,
      controller: textController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email:',
        hintText: 'you@email.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      controller: textController,
      decoration: InputDecoration(labelText: 'Password:', hintText: '123abc'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Submit'));
  }
}
