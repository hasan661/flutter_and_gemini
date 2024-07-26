import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_and_gemini/screens/recipe_screen.dart';
import 'package:flutter_and_gemini/shared/full_screen_loader.dart';
import 'package:flutter_and_gemini/shared/custom_elevated_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/gemini_service.dart';
import '../services/recipe_model.dart';
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
  FoodItem? foodItem;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    
    // Scaffold(
    //   appBar: AppBar(
    //     backgroundColor:
    //         AppColors.primaryColor, // Darker app bar for better contrast
    //     title: Text(
    //       widget.title,
    //       style: GoogleFonts.lato(
    //         fontSize: 24.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: ValueListenableBuilder(
    //     valueListenable: isLoadingNotifier,
    //     builder: (context, loading, child) => Stack(
    //       children: [
    //         SingleChildScrollView(
    //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment:
    //                 CrossAxisAlignment.center, // Center text and buttons
    //             children: [
    //               const SizedBox(
    //                   height: 40.0), // Spacing between app bar and content
    //               Text(
    //                 "What's Cooking?",
    //                 style: GoogleFonts.lato(
    //                   fontSize: 32.0,
    //                   fontWeight: FontWeight.bold,
    //                   color: AppColors
    //                       .primaryColor, // Darker text for better legibility
    //                 ),
    //               ),
    //               const SizedBox(
    //                   height: 20.0), // Spacing between title and description
    //               Text(
    //                 "Discover a recipe from a photo",
    //                 style: GoogleFonts.montserrat(
    //                   fontSize: 18.0,
    //                   fontWeight: FontWeight.w500,
    //                   color:
    //                       Colors.black54, // Subdued text for better readability
    //                 ),
    //               ),
    //               const SizedBox(
    //                   height: 40.0), // Spacing between description and buttons
    //               Column(
    //                 children: [
    //                   CustomElevatedButton(
    //                     onPressed: () => checkIsFoodItem(ImageSource.gallery),
    //                     text: "Upload Image From Gallery",
    //                     iconData: Icons.photo_library,
    //                     borderColor: Colors.white,
    //                     buttonColor: AppColors.primaryColor!,
    //                     buttonTextColor: Colors.white,
    //                   ),
    //                   const SizedBox(
    //                     height: 20,
    //                   ),
    //                   CustomElevatedButton(
    //                     onPressed: () => checkIsFoodItem(ImageSource.camera),
    //                     text: "Capture From Camera",
    //                     iconData: Icons.camera,
    //                     borderColor: AppColors.primaryColor!,
    //                     buttonColor: Colors.white,
    //                     buttonTextColor: AppColors.primaryColor!,
    //                   ),
    //                   if (pickedImage != null &&
    //                       (foodItem?.isFoodItem ?? false))
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         Center(
    //                           child: Text(
    //                             foodItem?.title ?? "",
    //                             style: GoogleFonts.lato(
    //                               fontSize: 26,
    //                               fontWeight: FontWeight.w700,
    //                               color: AppColors
    //                                   .primaryColor, // Darker text for better legibility
    //                             ),
    //                           ),
    //                         ),
    //                         const Divider(),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         Container(
    //                           width: double.infinity,
    //                           height: 240,
    //                           decoration: BoxDecoration(
    //                             image: DecorationImage(
    //                               image: FileImage(pickedImage!),
    //                               fit: BoxFit.cover,
    //                               colorFilter: ColorFilter.mode(
    //                                 Colors.black.withOpacity(0.5),
    //                                 BlendMode.srcOver,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         CustomElevatedButton(
    //                           onPressed: () =>
    //                               getRecipe(),
    //                           text:
    //                               "Get The Recipe For ${foodItem?.title ?? ""}",
    //                           iconData: null,
    //                           borderColor: Colors.white,
    //                           buttonColor: AppColors.primaryColor!,
    //                           buttonTextColor: Colors.white,
    //                         ),
    //                       ],
    //                     )
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         loading ? const FullScreenLoader() : const Center(),
    //       ],
    //     ),
    //   ),
    // );
  
  }

  // checkIsFoodItem(ImageSource imageSource) async {
  //   final imagePicker = ImagePicker();
  //   isLoadingNotifier.value = true;
  //   final pickedFile = await imagePicker.pickImage(source: imageSource);
  //   if (pickedFile == null) {
  //     isLoadingNotifier.value = false;
  //     return;
  //   }
  //   pickedImage = File(pickedFile.path);
  //   foodItem = await geminiService.checkIsFoodItem(pickedImage);

  //   isLoadingNotifier.value = false;
  // }

  // getRecipe() async {
  //   isLoadingNotifier.value = true;
  //   await geminiService.sendTextAndImage(foodItem!.title).then((recipe) {
  //     isLoadingNotifier.value = false;
  //     if (recipe != null) {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => RecipeScreen(
  //             recipeModel: recipe,
  //             pickedImage: pickedImage!,
  //           ),
  //         ),
  //       );
  //     }
  //   });
  // }

}
