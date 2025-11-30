import 'package:flutter/material.dart';

enum BadgeCategory {
  study("STUDY", Color(0xFF7990F8), Color(0x227990F8)),
  work("WORK", Color(0xFF46CF8B), Color(0x2246CF8B)),
  other("OTHER", Color(0xFFBC5EAD), Color(0x22BC5EAD));

  final String title;
  final Color color;
  final Color backgroundColor;

  const BadgeCategory(this.title, this.color, this.backgroundColor);
}
