import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_and_gemini/services/recipe_model.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(recipeModel.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(pickedImage),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: recipeModel.ingredients.length,
              itemBuilder: (context, index) =>
                  Text("${index + 1}) ${recipeModel.ingredients[index]}"),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Instructions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: recipeModel.instructions.length,
              itemBuilder: (context, index) =>
                  Text("${index + 1}) ${recipeModel.instructions[index]}"),
            )
          ],
        ),
      ),
    );
  }
}
