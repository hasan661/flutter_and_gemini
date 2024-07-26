import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

class HelperFunctions{
  returnToast(String text){
    Fluttertoast.showToast(
            msg: text,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors().primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
  }
}