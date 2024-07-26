import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_and_gemini/services/recipe_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as content;

import '../shared/constants.dart';
import '../shared/helper_functions.dart';

class GeminiService {
  final model = content.GenerativeModel(
      model: StringConstants().model, apiKey: StringConstants().apiKey);

  Future<RecipeModel?> sendTextAndImage(File imageFile) async {
    RecipeModel? recipeModel;
    final byte = await imageFile.readAsBytes();
    try {
      if (await checkIsFoodItem(imageFile)) {
        final response = await model.generateContent([
          content.Content.text(
              "Generate a JSON object containing the following fields:title: A string representing the recipe name.ingredients: An array of strings, each representing a recipe ingredient.instructions: An array of strings, each representing a step in the recipe instructions."),
          content.Content.data("image/png", byte),
        ]);
        var jsonString = response.text!.substring(
              response.text!.indexOf("{"), response.text!.indexOf("}") + 1);
          recipeModel = RecipeModel.fromJson(jsonDecode(jsonString));
      } else {
        HelperFunctions().returnToast("Please select a food item");
      }
    } catch (e) {
      if (e is SocketException || e is TimeoutException) {
        HelperFunctions().returnToast("Please Check The Internet Connection");
      }
    }
    return recipeModel;
  }

  Future<bool> checkIsFoodItem(File? inputImage) async {
    final byte = await inputImage?.readAsBytes();
    final response = await model.generateContent([
      content.Content.text(
        "Is this image depicting a food item? Respond with 'yes' or 'no' only.",
      ),
      content.Content.data("image/png", byte!),
    ]);
    return response.text!.toLowerCase().contains("yes");
  }
}
