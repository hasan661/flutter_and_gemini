import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_and_gemini/screens/recipe_screen.dart';
import 'package:flutter_and_gemini/shared/image_upload_button.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

import '../services/gemini_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GeminiService geminiService = GeminiService();
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(widget.title),
      ),
      body: ImageUploadButton(
        onPressed: () => _showPicker(context),
        text: "Pick An Image",
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pick Image From Gallery'),
              onTap: () async {
                final imagePicker = ImagePicker();
                final pickedFile =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    pickedImage = File(pickedFile.path);
                  });
                  var a = await geminiService.sendTextAndImage(pickedImage!);
                  if (a != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipeScreen(
                              recipeModel: a,
                              pickedImage: pickedImage!,
                            )));
                  }
                  // log(a.toString());
                  // Handle your picked image here (e.g., upload, display)
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take Photo'),
              onTap: () async {
                final imagePicker = ImagePicker();
                final pickedFile =
                    await imagePicker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    pickedImage = File(pickedFile.path);
                  });
                  var a = await geminiService.sendTextAndImage(pickedImage!);
                  if (a != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipeScreen(
                              recipeModel: a,
                              pickedImage: pickedImage!,
                            )));
                  }
                  // log(a.toString());
                  // Handle your picked image here (e.g., upload, display)
                }
              },
            ),
          ],
        );
      },
    );
  }
}
