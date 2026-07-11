import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';

// Creating a mixin that adds image picking capabilities
mixin FilePickerMixin<T extends StatefulWidget> on State<T> {
  Uint8List? selectedImageBytes;

  Future<void> pickImage() async {
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
}
