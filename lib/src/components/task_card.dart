import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../screens/home_screen.dart';
import '../utils/snackbar.dart';
import '../utils/supabase.dart';

/// Component [TaskCard] ใช้ร่วมกับ Widget [SliverList.separated] ที่หน้า [HomeScreen]
///
/// ใช้อัพเดท task [_TaskCardState.onUpdateTask] และ
/// delete [_TaskCardState.onDeleteTask] โดยเรียกใช้ [TaskService] อีกที
///
/// คลาสนี้มี 1 attribute คือ [task] มี type เป็น [TaskModel] รับมากจาก [HomeScreen]
class TaskCard extends StatefulWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  /// set ค่าเรื่มต้นของ [isChecked] ให้อิงตาม task ที่รับเข้ามา true/false
  @override
  void initState() {
    setState(() {
      isChecked = widget.task.isDone;
    });
    super.initState();
  }

  Future<void> onUpdateTask() async {
    setState(() => isChecked = true);
    try {
      await TaskService.updateTask(widget.task.id);

      if (!mounted) return;

      SnackbarService.showSnackBar(context, 'Update task success!');
    } catch (e) {
      SnackbarService.showSnackBar(context, 'Error: $e');

      setState(() => isChecked = false);
    }
  }

  Future<void> onDeleteTask(_) async {
    try {
      await TaskService.deleteTask(widget.task.id);

      if (!mounted) return;

      SnackbarService.showSnackBar(context, 'Delete task success!');
    } catch (e) {
      SnackbarService.showSnackBar(context, 'Error: $e');
    }
  }

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
      onDismissed: onDeleteTask,
      child: ListTile(
        onTap: isChecked ? null : onUpdateTask,
        contentPadding: const .symmetric(vertical: 6, horizontal: 18),
        leading: Checkbox(value: isChecked, tristate: true, onChanged: null),
        title: Text(
          widget.task.title,
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
