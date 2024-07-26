import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_and_gemini/services/recipe_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as content;

import '../shared/constants.dart';
import '../shared/helper_functions.dart';

class GeminiService {
  final model = content.GenerativeModel(
      model: StringConstants().model, apiKey: StringConstants().apiKey);

  Future<RecipeModel?> sendTextAndImage(String text) async {
    RecipeModel? recipeModel;
    try {
      final response = await model.generateContent([
        content.Content.text(
          "Generate a JSON object for $text containing the following fields:title: A string representing the recipe name.ingredients: An array of strings, each representing a recipe ingredient.instructions: An array of strings, each representing a step in the recipe instructions.",
        ),
      ]);
      var jsonString = response.text!.substring(
          response.text!.indexOf("{"), response.text!.indexOf("}") + 1);
      recipeModel =
          RecipeModel.fromJson(jsonDecode(jsonString), text, response.text!);
      log(response.text.toString());
    } catch (e) {
      if (e is SocketException || e is TimeoutException) {
        HelperFunctions().returnToast("Please Check The Internet Connection");
      }
    }
    return recipeModel;
  }

  Future<FoodItem?> checkIsFoodItem(File? inputImage) async {
    FoodItem? foodItem;
    try {
      final byte = await inputImage?.readAsBytes();
      final response = await model.generateContent([
        content.Content.text(
          "Generate a JSON object containing the following fields: isFoodItem (bool representing whether it is a food item or not), title(Name Of the food item)",
        ),
        content.Content.data("image/png", byte!),
      ]);

      var jsonString = response.text!.substring(
          response.text!.indexOf("{"), response.text!.indexOf("}") + 1);
      log(response.text.toString());

      foodItem = FoodItem.fromJson(jsonDecode(jsonString), response.text!);

      if (!foodItem.isFoodItem) {
        HelperFunctions().returnToast("Please select a food item");
      }
    } catch (e) {
      if (e is SocketException || e is TimeoutException) {
        HelperFunctions().returnToast("Please Check The Internet Connection");
      }
    }
    return foodItem;
  }
}
