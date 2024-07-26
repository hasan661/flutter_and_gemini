import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class ImageUploadButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;

  const ImageUploadButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconData, // Default background color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
         // Apply background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        minimumSize: const Size(100, 50), // Set a reasonable size
        padding: const EdgeInsets.all(12.0), // Adjust padding for content
      ),
      child: Row( // Use Row to arrange icon and text horizontally
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        children: [
          Icon(
            iconData,
            size: 24.0, // Adjust icon size to fit within button
            color: AppColors().primaryColor,// Maintain icon color
          ),
          const SizedBox(width: 10.0), // Spacing between icon and text
          Text(
            text,
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: AppColors().primaryColor,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
