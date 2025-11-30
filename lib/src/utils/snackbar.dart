import 'package:flutter/material.dart';

/// Service [SnackbarService] ใช้สำหรับเรียก Function [showSnackBar] เวอร์ชั่นสั้นลง
class SnackbarService {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
