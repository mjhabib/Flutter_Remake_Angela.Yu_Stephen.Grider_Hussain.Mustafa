import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late double deviceHeight, deviceWidth;
  late GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  String? name, email, password;

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
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                registrationTitle(),
                registrationForm(),
                registrationButton(),
                loginScreenLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registrationTitle() {
    return const Text(
      "Register to Finstagram",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget registrationForm() {
    return SizedBox(
      height: deviceHeight * 0.30,
      child: Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [nameTextField(), emailTextField(), passwordTextField()],
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Name..."),
      validator: (value) => value!.isNotEmpty ? null : "Please enter a name.",
      onSaved: (value) {
        setState(() {
          name = value;
        });
      },
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email..."),
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
      validator: (value) {
        bool result = value!.contains(
          RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
          ),
        );
        return result ? null : "Please enter a valid email";
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(hintText: "Password..."),
      onSaved: (value) {
        setState(() {
          password = value;
        });
      },
      validator: (value) => value!.length > 6
          ? null
          : "Please enter a password greater than 6 characters.",
    );
  }

  Widget registrationButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: deviceWidth * 0.7,
      height: deviceHeight * 0.06,
      color: Colors.redAccent,
      child: const Text(
        "Register",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget loginScreenLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'login'),
      child: Text(
        'Or login instead...',
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.w200,
          fontSize: 15,
        ),
      ),
    );
  }
}
