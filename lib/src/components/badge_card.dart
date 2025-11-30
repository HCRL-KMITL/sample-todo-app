import 'package:flutter/material.dart';

import '../models/badge_category.dart';

/// Component [BadgeCard] อันนี้ทำเผื่อ
///
/// ใช้ระบุ Category ของ Task นั้นว่าเกี่ยวกับอะไรโดยเช็คกับ [BadgeCategory]
/// คลาสนี้ไม่ถูกเรียกใช้ที่ไหนทำไว้เผื่อ
class BadgeCard extends StatelessWidget {
  final bool disable;
  const BadgeCard({super.key, this.disable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: disable
            ? Colors.black.withValues(alpha: 0.1)
            : BadgeCategory.study.backgroundColor,
        borderRadius: .circular(4),
      ),
      child: Text(
        BadgeCategory.study.title,
        style: TextStyle(
          fontSize: 12,
          color: disable
              ? Colors.black.withValues(alpha: 0.3)
              : BadgeCategory.study.color,
          fontWeight: .w700,
        ),
      ),
    );
  }
}
