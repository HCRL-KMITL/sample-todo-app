import 'package:flutter/material.dart';

import '../utils/snackbar.dart';
import '../utils/supabase.dart';

/// คลาส [NewTaskScreen] เป็นหน้าสำหรับ Create Task
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final controller = TextEditingController();

  /// ฟังก์ชัน validate ข้อมูล ก่อนเรียกฟังก์ชัน Create ใน [TaskService]
  Future<void> onBottomButtonTapped() async {
    /* ตัดพื้นที่ว่างใน String ออกเช่น "         test           " => "test" */
    final title = controller.text.trim();

    if (title.isEmpty) return;

    try {
      await TaskService.createTask(controller.text);

      if (!mounted) return;

      Navigator.pop(context);

      SnackbarService.showSnackBar(context, 'Create task success!');
    } catch (e) {
      SnackbarService.showSnackBar(context, 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const .all(22),
            child: _View(controller: controller),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const .symmetric(horizontal: 22),
          child: _BottomButton(onTap: onBottomButtonTapped),
        ),
      ),
    );
  }
}

class _View extends StatelessWidget {
  final TextEditingController controller;

  const _View({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 56,
      children: [
        _CloseButton(),
        TextField(
          controller: controller,
          maxLines: null,
          autofocus: true,
          cursorColor: Colors.deepOrange,
          decoration: InputDecoration(
            border: .none,
            hint: Text(
              "Write a new task...",
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.3),
                fontSize: 36,
              ),
            ),
          ),
          style: const TextStyle(fontSize: 36),
        ),
      ],
    );
  }
}

class _CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.close_rounded, size: 36),
        ),
      ],
    );
  }
}

class _BottomButton extends StatelessWidget {
  final Function()? onTap;

  const _BottomButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: const .symmetric(vertical: 16),
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: .w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
