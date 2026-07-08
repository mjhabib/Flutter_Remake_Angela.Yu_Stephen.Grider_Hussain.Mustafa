import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double deviceHeight, deviceWidth;
  late GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String? emailValue, passwordValue;

  void Function(String?)? emailOnSaved(String? newValue) {
    setState(() {
      emailValue = newValue;
    });
    return null;
  }

  void Function(String?)? passwordOnSaved(String? newValue) {
    setState(() {
      passwordValue = newValue;
    });
    return null;
  }

  String? emailValidator(String? value) {
    bool result = value!.contains(
      RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
      ),
    );
    return result ? null : "Please enter a valid email";
  }

  String? passwordValidator(String? value) {
    return value!.length > 6
        ? null
        : "Please enter a password greater than 6 characters.";
  }

  void validateUser() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      print(emailValue);
      print(passwordValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [loginTitle(), loginForm(), loginButton()],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginTitle() {
    return Text(
      'Login to Finstagram',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget loginForm() {
    return SizedBox(
      height: deviceHeight * 0.25,
      child: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            mailPassTextFields(
              textHint: 'email@something.com',
              onSaved: (newValue) {
                emailOnSaved(newValue);
              },
              validator: (String? value) {
                return emailValidator(value);
              },
            ),
            mailPassTextFields(
              textHint: 'password...',
              obscureText: true,
              onSaved: (newValue) {
                passwordOnSaved(newValue);
              },
              validator: (String? value) {
                return passwordValidator(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget mailPassTextFields({
    required String textHint,
    required void Function(String?)? onSaved,
    bool obscureText = false,
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(hint: Text(textHint)),
      onSaved: onSaved,
      validator: validator,
    );
  }

  Widget loginButton() {
    return MaterialButton(
      onPressed: validateUser,
      minWidth: deviceWidth * 0.7,
      height: deviceHeight * 0.06,
      color: Colors.redAccent,
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
