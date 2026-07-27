import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart';

String imageConverter({
  required FileSystemEntity selectedFile,
  required String format,
}) {
  // since we already have a list of files (not entities including folders) we tell dart to recognize our image as a File not an entity
  final rawImage = (selectedFile as File).readAsBytesSync();

  final image = decodeImage(rawImage);

  Uint8List newImage;
  if (format == 'jpg') {
    newImage = encodeJpg(image!);
  } else if (format == 'png') {
    newImage = encodePng(image!);
  } else {
    // assign a new value to prevent the non-nullable error
    newImage = Uint8List(0);
    stdout.writeln('Sorry, unsupported file type!');
  }

  // save the newImage on computer with a new extension (name)
  final newPath = replaceExtension(selectedFile.path, format);
  File(newPath).writeAsBytesSync(newImage);

  // we're returning the path so we can attempt to open it later on
  return newPath;
}

// a helper function to replace an old extention (name) with a new one
String replaceExtension(String path, String newExtension) {
  return path.replaceAll(RegExp(r'(png|jpg|jpeg)'), newExtension);
}
