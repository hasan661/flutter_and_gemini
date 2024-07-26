import 'package:flutter/material.dart';

import 'constants.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.delayed(Duration.zero).then((value) => false);
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          backgroundBlendMode: BlendMode.darken,
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors().primaryColor,
          ),
        ),
      ),
    );
  }
}