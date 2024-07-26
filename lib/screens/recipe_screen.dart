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
    return const Placeholder();
    // SafeArea(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       leading: IconButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //         icon: const Icon(
    //           Icons.arrow_back,
    //           color: Colors.white,
    //         ),
    //       ),
    //       backgroundColor:
    //           AppColors.primaryColor, // Darker app bar for better contrast
    //       title: Text(
    //         "Recipe",
    //         style: GoogleFonts.lato(
    //           fontSize: 24.0,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.white,
    //         ),
    //       ),
    //       centerTitle: true,
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             width: double.infinity,
    //             height: 240,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: FileImage(pickedImage),
    //                 fit: BoxFit.cover,
    //                 colorFilter: ColorFilter.mode(
    //                   Colors.black.withOpacity(0.5),
    //                   BlendMode.srcOver,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 10),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 20,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Center(
    //                   child: Text(
    //                     recipeModel.title,
    //                     style: GoogleFonts.lato(
    //                       fontSize: 26,
    //                       fontWeight: FontWeight.w700,
    //                       color: AppColors
    //                           .primaryColor, // Darker text for better legibility
    //                     ),
    //                   ),
    //                 ),
    //                 const Divider(),
    //                 const SizedBox(height: 10),
    //                 Row(
    //                   children: [
    //                     const Icon(Icons.food_bank_outlined),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     Text(
    //                       "Ingredients",
    //                       style: GoogleFonts.lato(
    //                         textStyle: TextStyle(
    //                           color: AppColors.primaryColor,
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 ListView.builder(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   primary: false,
    //                   shrinkWrap: true,
    //                   padding: const EdgeInsets.symmetric(
    //                     vertical: 10,
    //                   ),
    //                   itemCount: recipeModel.ingredients.length,
    //                   itemBuilder: (context, index) => Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 5),
    //                     child: Text(
    //                         "${index + 1}) ${recipeModel.ingredients[index]}"),
    //                   ),
    //                 ),
    //                 const Divider(),
    //                 Row(
    //                   children: [
    //                     const Icon(Icons.food_bank_outlined),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     Text(
    //                       "Instructions",
    //                       style: GoogleFonts.lato(
    //                           textStyle: TextStyle(
    //                               color: AppColors.primaryColor,
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.bold)),
    //                     ),
    //                   ],
    //                 ),
    //                 ListView.builder(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   primary: false,
    //                   shrinkWrap: true,
    //                   padding: const EdgeInsets.symmetric(
    //                     vertical: 10,
    //                   ),
    //                   itemCount: recipeModel.instructions.length,
    //                   itemBuilder: (context, index) => Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 5),
    //                     child: Text(
    //                         "${index + 1}) ${recipeModel.instructions[index]}"),
    //                   ),
    //                 ),

    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
