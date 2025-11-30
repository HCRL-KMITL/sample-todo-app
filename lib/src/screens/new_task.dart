import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(padding: const .all(22), child: _View()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const .symmetric(horizontal: 22),
          child: _BottomButton(),
        ),
      ),
    );
  }
}

class _View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 56,
      children: [
        _CloseButton(),
        TextField(
          maxLines: null,
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
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
