import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';

import 'package:finstagram_app/services/firebase_brain.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late double deviceHeight, deviceWidth;
  late GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  String? name, email, password;
  Uint8List? selectedImageBytes;
  FirebaseBrain? firebaseBrain;
  String? errorMessage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    firebaseBrain = FirebaseBrain();
  }

  void validateUser() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();

      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      try {
        final result = await firebaseBrain!.registerUser(
          name: name!,
          email: email!,
          password: password!,
          imageBytes: selectedImageBytes!,
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

  Future<void> filePicker() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true, // CRITICAL: This loads bytes for web
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        // On web, file.bytes will be populated because withData: true
        if (file.bytes != null) {
          setState(() {
            selectedImageBytes = file.bytes;
          });
        } else {
          // Fallback: Try reading from path (mobile/desktop only)
          if (file.path != null) {
            final File imageFile = File(file.path!);
            final Uint8List bytes = await imageFile.readAsBytes();
            setState(() {
              selectedImageBytes = bytes;
            });
          } else {
            print('No bytes or path available');
          }
        }
      } else {
        print('User canceled file picker');
      }
    } catch (e, stacktrace) {
      print('Error picking file: $e');
      print('Stacktrace: $stacktrace');

      // Show error to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // Future<void> imagePicker() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? imageFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (imageFile != null) {
  //     // Read the image bytes for web compatibility
  //     final bytes = await imageFile.readAsBytes();
  //     setState(() {
  //       selectedImageBytes = bytes;
  //     });
  //   }
  // }

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
                imageProfile(),
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

  Widget imageProfile() {
    return GestureDetector(
      // onTap: imagePicker,
      onTap: filePicker,
      child: Container(
        // to make it square we used only height as value
        height: deviceHeight * 0.15,
        width: deviceHeight * 0.15,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: selectedImageBytes != null
                ? MemoryImage(selectedImageBytes!)
                : const AssetImage('images/image_placeholder.png'),
          ),
        ),
      ),
    );
  }

  Widget registrationForm() {
    return SizedBox(
      height: deviceHeight * 0.40,
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
                  'Register',
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
