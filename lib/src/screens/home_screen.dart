import 'package:flutter/material.dart';

import '../components/home_title.dart';
import '../components/task_card.dart';
import '../models/task_model.dart';
import '../utils/supabase.dart';
import 'new_task_screen.dart';

/// หน้า [HomeScreen] สำหรับแสดง Task ทั้งหมดจาก Supabase
///
/// ข้อมูลทั้งหมดจะถูกอัพเดทแบบ Realtime ผ่าน [StreamBuilder]
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: HomeTitle(),
              floating: true,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            StreamBuilder(
              stream: TaskService.readTasks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == .waiting) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF393433),
                      ),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return SliverFillRemaining(
                    child: Center(child: Text("Error: ${snapshot.error}")),
                  );
                }

                final data = snapshot.data ?? [];

                if (data.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: Text("Empty")),
                  );
                }

                /* นำ raw data ที่ไม่มี type แปลงเป็น TaskModel */
                final tasks = data.map((e) => TaskModel.fromJson(e)).toList();

                return SliverList.separated(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) => TaskCard(task: tasks[index]),
                  separatorBuilder: (context, index) => const Padding(
                    padding: .symmetric(horizontal: 22),
                    child: Divider(height: 0, thickness: 0.8),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NewTaskScreen()),
        ),
        backgroundColor: const Color(0xFF393433),
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }
}
