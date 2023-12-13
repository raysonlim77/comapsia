import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
    static void toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor:const Color(0xff3d3f50).withOpacity(0.95),
        textColor: const Color(0xFFF5F7F9));
  }
}