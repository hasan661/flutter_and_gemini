class RecipeModel {
  final String title;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeModel(
      {required this.ingredients,
      required this.instructions,
      required this.title});
  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        title: json['title'] as String,
        ingredients: List<String>.from(json['ingredients']),
        instructions: List<String>.from(json['instructions']),
      );
}
