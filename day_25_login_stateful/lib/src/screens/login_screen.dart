import 'package:flutter/material.dart';
import 'package:virtual_keypad/virtual_keypad.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? email, password;

  void onPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('Email: $email and password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formKey,
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
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email:',
        hintText: 'you@email.com',
      ),
      validator: (value) {
        if (value!.isEmpty && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (newValue) {
        email = newValue;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password:', hintText: '123abc'),
      validator: (value) {
        if (value!.isEmpty && value.length < 6) {
          return 'Please enter a password greater than 6 characters';
        }
        return null;
      },
      onSaved: (newValue) {
        password = newValue;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: onPressed, child: Text('Submit'));
  }
}
