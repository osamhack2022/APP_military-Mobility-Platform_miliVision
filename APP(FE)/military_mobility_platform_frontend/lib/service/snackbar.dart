import 'package:flutter/material.dart';

class Snackbar {
  const Snackbar(this.context);
  final BuildContext context;

  void showInfo(String content, {double duration = 0.7}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(milliseconds: (1000.0 * duration).round()),
    ));
  }

  void showError(String content, {double duration = 0.7}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: const Color(0xFF8F2626),
      duration: Duration(milliseconds: (1000.0 * duration).round()),
    ));
  }

  void showSuccess(String content, {double duration = 0.7}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: const Color(0xFF186E44),
      duration: Duration(milliseconds: (1000.0 * duration).round()),
    ));
  }
}
