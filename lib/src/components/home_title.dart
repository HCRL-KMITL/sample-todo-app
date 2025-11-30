import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: .center,
      children: [
        const SizedBox(width: 6),
        const Text(
          "Today",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
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
