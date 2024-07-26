import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_and_gemini/services/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/constants.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
    required this.recipeModel,
    required this.pickedImage,
  });
  final RecipeModel recipeModel;
  final File pickedImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Center(),
        backgroundColor:
            AppColors().primaryColor, // Darker app bar for better contrast
        title: Text(
          recipeModel.title,
          style: GoogleFonts.pacifico(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(pickedImage),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            color: AppColors().primaryColor,
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      itemCount: recipeModel.ingredients.length,
                      itemBuilder: (context, index) => Text(
                          "${index + 1}) ${recipeModel.ingredients[index]}"),
                    ),
                    Text(
                      "Instructions",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            color: AppColors().primaryColor,
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      itemCount: recipeModel.instructions.length,
                      itemBuilder: (context, index) => Text(
                          "${index + 1}) ${recipeModel.instructions[index]}"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
