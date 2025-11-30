import 'package:flutter/material.dart';

/// [BadgeCategory] เป็น type enum มีไว้ทำเป็น Category สำหรับบอกว่า Task นั้นเกี่ยวกับอะไร
///
/// [study] - task เกี่ยวกับการเรียน
///
/// [work] - task เกี่ยวกับการทำงาน
///
/// [other] - task อื่นๆที่ไม่เกี่ยวข้องกับที่เหลือ
///
/// ประกอบไปด้วย 3 attributes ได้แก่ [title], [color], [backgroundColor]
///
/// [title] - เปลี่ยนจาก enum types ใน [BadgeCategory] เป็น String Uppercase
///
/// [color] - สีของตัวหนังสือ
///
/// [backgroundColor] - สีของพื้นหลัง
enum BadgeCategory {
  study("STUDY", Color(0xFF7990F8), Color(0x227990F8)),
  work("WORK", Color(0xFF46CF8B), Color(0x2246CF8B)),
  other("OTHER", Color(0xFFBC5EAD), Color(0x22BC5EAD));

  final String title;
  final Color color;
  final Color backgroundColor;

  const BadgeCategory(this.title, this.color, this.backgroundColor);
}
