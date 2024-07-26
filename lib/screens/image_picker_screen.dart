import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_and_gemini/screens/recipe_screen.dart';
import 'package:flutter_and_gemini/shared/full_screen_loader.dart';
import 'package:flutter_and_gemini/shared/image_upload_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/gemini_service.dart';
import '../shared/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GeminiService geminiService = GeminiService();
  File? pickedImage;
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColors().primaryColor, // Darker app bar for better contrast
        title: Text(
          widget.title,
          style: GoogleFonts.pacifico(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center text and buttons
          children: [
            const SizedBox(height: 40.0), // Spacing between app bar and content
            Text(
              "What's Cooking?",
              style: GoogleFonts.pacifico(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: AppColors().primaryColor, // Darker text for better legibility
              ),
            ),
            const SizedBox(
                height: 20.0), // Spacing between title and description
            Text(
              "Discover a recipe from a photo",
              style: GoogleFonts.montserrat(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black54, // Subdued text for better readability
              ),
            ),
            const SizedBox(
                height: 40.0), // Spacing between description and buttons
            Column(
              children: [
                ImageUploadButton(
                  onPressed: () =>
                      pickAnImageAndUploadOnGemini(ImageSource.gallery),
                  text: "Upload Image From Gallery",
                  iconData: Icons.photo_library,
                ),
                const SizedBox(
                  height: 20,
                ),
                ImageUploadButton(
                  onPressed: () =>
                      pickAnImageAndUploadOnGemini(ImageSource.camera),
                  text: "Capture From Camera",
                  iconData: Icons.camera,
                ),
              ],
            ),
          ],
        ),
      ),
      ValueListenableBuilder(valueListenable: isLoadingNotifier, builder: (context, loading, child) => loading?const FullScreenLoader():const Center() ,)
    
        ],
      )
    );
  }

  pickAnImageAndUploadOnGemini(ImageSource imageSource) async {
    final imagePicker = ImagePicker();
    isLoadingNotifier.value = true;
    final pickedFile = await imagePicker.pickImage(source: imageSource);
    if (pickedFile == null) {
      isLoadingNotifier.value = false;
      return;
    }
    pickedImage = File(pickedFile.path);

    await geminiService.sendTextAndImage(pickedImage!).then((recipe) {
      isLoadingNotifier.value = false;
      if (recipe != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeScreen(
              recipeModel: recipe,
              pickedImage: pickedImage!,
            ),
          ),
        );
      }
    });
  }
}
