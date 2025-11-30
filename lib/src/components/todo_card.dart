import 'dart:developer';

import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String title;
  const TodoCard({super.key, required this.title});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: .endToStart,
      background: Container(color: const Color(0xFFFF2B4E)),
      secondaryBackground: Container(
        color: const Color(0xFFFF2B4E),
        alignment: .centerRight,
        padding: const .only(right: 20.0),
        child: const Text(
          "Delete",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      onDismissed: (_) {
        log("Deleted");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text(' dismissed')));
      },
      child: ListTile(
        onTap: isChecked ? null : () => setState(() => isChecked = !isChecked),
        contentPadding: const .symmetric(vertical: 6, horizontal: 18),
        leading: Checkbox(value: isChecked, tristate: true, onChanged: null),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: .w500,
            color: isChecked ? Colors.black.withValues(alpha: 0.3) : null,
          ),
        ),
        // title: Column(
        //   crossAxisAlignment: .start,
        //   children: [
        //     BadgeCard(disable: isChecked),
        //   ],
        // ),
      ),
    );
  }
}
