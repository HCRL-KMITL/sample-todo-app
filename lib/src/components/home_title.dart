import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/home_screen.dart';

/// Component [HomeTitle] ใช้ที่หน้า [HomeScreen]
///
/// โดยจะระบุวันและเดือนปัจจุบัน และใช้ [DateFormat] ในการแปลง [DateTime.now] ให้เป็น
/// String ตาม Format ที่ต้องการ ในที่นี้จะเป็น วันที่ เดือน(ตัวย่อ) หากต้องการใช้ตัวเต็ม
/// ให้ใช้ MMMM ที่ [DateFormat]
class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: .center,
      children: [
        const SizedBox(width: 6),
        const Text("Today", style: TextStyle(fontSize: 36, fontWeight: .bold)),
        Text(
          DateFormat("dd MMM").format(DateTime.now()),
          style: TextStyle(
            fontSize: 36,
            color: Colors.black.withValues(alpha: 0.3),
          ),
        ),
      ],
    );
  }
}
