import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

pickImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: source);
  if (image != null) {
    return await image.readAsBytes();
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content))
  );
}
