import 'package:flutter/material.dart';

import 'package:finstagram_app/services/firebase_brain.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double deviceHeight, deviceWidth;
  late GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String? emailValue, passwordValue;
  FirebaseBrain? firebaseBrain;
  String? errorMessage;
  bool isLoading = false;

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

  Future<void> validateUser() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();

      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      try {
        final result = await firebaseBrain!.loginUser(
          email: emailValue!,
          password: passwordValue!,
        );

        setState(() {
          isLoading = false;
          if (!result.success) {
            errorMessage = result.error;
          }
        });

        // Navigate only if successful
        if (mounted && result.success) {
          Navigator.pushNamed(context, 'home');
        }
      } catch (e) {
        // Catch any unexpected errors
        setState(() {
          isLoading = false;
          errorMessage = 'An unexpected error occurred';
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    firebaseBrain = FirebaseBrain();
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
              children: [
                loginTitle(),
                loginForm(),
                loginButton(),
                registerScreenLink(),
              ],
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
              textHint: 'Email...',
              onSaved: (newValue) {
                emailOnSaved(newValue);
              },
              validator: (String? value) {
                return emailValidator(value);
              },
            ),
            mailPassTextFields(
              textHint: 'Password...',
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
      child: isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }

  Widget registerScreenLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'register'),
      child: Text(
        'Or register instead...',
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.w200,
          fontSize: 15,
        ),
      ),
    );
  }
}
