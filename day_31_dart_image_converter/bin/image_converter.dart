import 'dart:io';
import 'package:image_converter/image_converter.dart';
import 'package:prompter_mj/prompter_mj.dart';

void main() {
  final prompter = Prompter();
  final bool choice = prompter.askBinary('Do you wanna convert an image?');

  // exit if user chose 'n'
  if (!choice) {
    exit(0);
  }

  // continue if user chose 'y'
  final selectedFormat = prompter.askMultiple(
    'Select a format to convert to',
    buildFormatOptions(),
  );

  final selectedImage = prompter.askMultiple(
    'Select a file to convert',
    buildFileOptions(),
  );

  // ============================================================
  // The logic to convert the image and attempt to open it
  final newPath = imageConverter(
    selectedFile: selectedImage,
    format: selectedFormat,
  );

  final shouldOpen = prompter.askBinary('Do you wanna open the image?');
  if (shouldOpen) {
    openFile(newPath);
  } else {
    stdout.writeln('Here is your new image: $newPath');
  }
}

// ============================================================
// a helper function to create a list of image formats
List<Option> buildFormatOptions() {
  return [
    Option(label: 'Convert to jpg', value: 'jpg'),
    Option(label: 'Convert to png', value: 'png'),
  ];
}

// ============================================================
// a helper to create a list of file images
List<Option> buildFileOptions() {
  // for the currentDirectory/root we write:
  // final currentDirectory = Directory.current;

  // for a specific directory we write:
  final assetsDirectory = Directory('assets');

  // returns a List<FileSystemEntity> for each file or folder
  final filesFolders = assetsDirectory.listSync();

  // filter files & with the extensions of png|jpg|jpeg
  final images = filesFolders.where((image) {
    return FileSystemEntity.isFileSync(image.path) &&
        image.path.contains(RegExp(r'\.(png|jpg|jpeg)'));
  });

  // map over each image's name and turn it to a list of options
  final options = images.map((image) {
    // the code below works but only on windows
    // final filename = image.path.split('\\').last;

    // that's why we use this code instead to support all platforms
    final filename = image.path.split(Platform.pathSeparator).last;

    return Option(label: filename, value: image);
  }).toList();

  return options;

  // ALL IN ONE LINE:
  // return Directory('assets')
  //     .listSync()
  //     .where((image) {
  //       return FileSystemEntity.isFileSync(image.path) &&
  //           image.path.contains(RegExp(r'\.(png|jpg|jpeg)'));
  //     })
  //     .map((image) {
  //       final filename = image.path.split(Platform.pathSeparator).last;
  //       return Option(label: filename, value: image);
  //     })
  //     .toList();
}

// ============================================================
// A helper to attempt to open the new image in all platforms
void openFile(String path) {
  if (Platform.isWindows) {
    Process.run('start', [path], runInShell: true);
  } else if (Platform.isMacOS) {
    Process.run('open', [path]);
  } else if (Platform.isLinux) {
    Process.run('xdg-open', [path]);
  } else {
    stdout.writeln('Unsupported OS for opening files automatically');
    stdout.writeln('Your image is saved at: $path');
  }
}
