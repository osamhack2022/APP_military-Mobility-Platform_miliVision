import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void showInfoToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, webBgColor: "#a6a6a6", webPosition: "center");
  }

  static void showSuccessToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: const Color(0xFF69F0AE),
        webBgColor: "69f0ae",
        webPosition: "center");
  }

  static void showFailToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: const Color(0xFFFF5252),
        textColor: Colors.white,
        webBgColor: "ff5252",
        webPosition: "center");
  }
}
