class RecipeModel {
  final String title;
  final List<String> ingredients;
  final List<String> instructions;
  final String actualResponse;

  RecipeModel(
      {required this.ingredients,
      required this.instructions,
      required this.actualResponse,
      required this.title});
      
  factory RecipeModel.fromJson(
    Map<String, dynamic> json,
    String title,
    String response,
  ) =>
      RecipeModel(
        title: title,
        ingredients: List<String>.from(json['ingredients']),
        instructions: List<String>.from(json['instructions']),
        actualResponse: response,
      );
}

class FoodItem {
  final String title;
  final bool isFoodItem;

  final String actualResponse;

  FoodItem(
      {required this.isFoodItem,
      required this.title,
      required this.actualResponse});

  factory FoodItem.fromJson(Map<String, dynamic> json, String response) =>
      FoodItem(
          title: json['title'] as String,
          isFoodItem: json["isFoodItem"],
          actualResponse: response);
}
