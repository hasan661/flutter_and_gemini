import 'package:flutter/material.dart';
import 'package:flutter_and_gemini/screens/image_picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recipe Finder'),
    );
  }
}


// Steps For Gemini With Flutter

// Step 1: Go To https://aistudio.google.com. Get an api key and store it somewhere to use it later

// Step 2: Setup A Flutter Project 

// Step 3: Go To Pub Dev and get the flutter_gemini library and put them in the pubspec.yaml.

// Now just uncomment the UIs designed 

// Step 4: Add The Api Key to the StringsConstant class.

// Step 5: intialize a generative model with model name the model that you want the algorithm to run and api key that you have saved before

// Step 6: Create a function to send image and text 

// Step 7: Create a function that verifies whether the image you uploaded is a food item or not 

// Step 8: Call the sendTextAndImage with the image you choose