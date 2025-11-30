import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

/// คลาสหลักจะทำหน้าที่เป็น Settings ภายในแอพ เช่น Theme, Route, ภาษา
///
/// โดยจะ Return เป็น Widget ชื่อว่า [MaterialApp] และ หน้าแรก [HomeScreen]
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: .circular(5.99)),
          side: const BorderSide(color: Color(0xFFD6D6D6), width: 2),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: .circular(12)),
            backgroundColor: const Color(0xFF393433),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
