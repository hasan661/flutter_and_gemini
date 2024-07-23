import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_and_gemini/services/recipe_model.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as content;

class GeminiService {
  final _gemini = Gemini.instance;

  String? _response;
  String? get reponse => _response;
  void setResponse(String? value) {
    _response = value;
  }

  Future<RecipeModel?> sendTextAndImage(File imageFile) async {
    RecipeModel? recipeModel;
    final byte = await imageFile.readAsBytes();
    final model = content.GenerativeModel(
        model: "gemini-1.5-flash",
        apiKey: "AIzaSyBJunq6OliWjKt0qlrmXw0YLv2kDo7R230");

    final response = await model.generateContent([
      content.Content.text(
          "Model its recipe to a json object with 3 variables title(The Name), List<String> ingredients and List<String> instructions? Note Only give me a json not any other"),
      content.Content.data("image/png", byte),
      
    ]);
    for (var element in response.candidates) {
      var a=element.text!.substring(element.text!.indexOf("{"),element.text!.indexOf("}")+1);
      log(a);
      recipeModel = RecipeModel.fromJson(jsonDecode(a));
      
    }
    return recipeModel;
  }

  Future<bool> checkIsFoodItem(File? inputImage) async {
    final byte = await inputImage?.readAsBytes();
    await _gemini.textAndImage(
      text: "Is this food item? Answer with strictly yes or no",
      images: [byte!],
    );

    return _gemini.typeProvider!.response!.contains("yes");
  }
}
