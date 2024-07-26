import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? iconData;
  final Color borderColor;
  final Color buttonColor;
  final Color buttonTextColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconData, // Default background color
    required this.borderColor,required this.buttonColor,required this.buttonTextColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        
         // Apply background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          side: BorderSide(color: borderColor)
        ),
        minimumSize: const Size(100, 50), // Set a reasonable size
        padding: const EdgeInsets.all(12.0), // Adjust padding for content
      ),
      child: Row( // Use Row to arrange icon and text horizontally
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        children: [
          if(iconData!=null)
          Icon(
            iconData,
            size: 24.0, // Adjust icon size to fit within button
            color: buttonTextColor,// Maintain icon color
          ),
          const SizedBox(width: 10.0), // Spacing between icon and text
          Text(
            text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: buttonTextColor,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
