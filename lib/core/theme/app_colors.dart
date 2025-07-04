import 'package:flutter/material.dart';

class AppColors {
   static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF9EC9C2), // xanh ngọc
      Color(0xFFF8A17E), // cam hồng

    ],
  );
  static const Color primary =Color.fromRGBO(185, 1, 1, 1); // Màu chủ đạo
  static const Color secondary = Color(0xFF1976D2); // Màu phụ
  static const Color background = Colors.white; // Màu nền
  static const Color white = Colors.white; // Màu nền
  static const Color textPrimary = Color.fromARGB(255, 255, 255, 15); // Màu chữ chính
  static const Color textSecondary = Colors.grey; // Màu chữ phụ
  static const Color error = Colors.red; // Màu lỗi
}
