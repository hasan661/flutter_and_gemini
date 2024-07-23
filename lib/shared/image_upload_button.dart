import 'package:flutter/material.dart';

class ImageUploadButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const ImageUploadButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Icon(
              Icons.add_a_photo,
              size: 40.0,
              color: Colors.grey[800],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
