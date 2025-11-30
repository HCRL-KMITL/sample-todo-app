import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/task_card.dart';
import '../screens/home_screen.dart';
import '../screens/new_task_screen.dart';

/// ประกาศ [SupabaseClient] เอาไว้เรียกใช้ในที่ต่างๆ
final SupabaseClient supabase = Supabase.instance.client;

/// Class [TaskService] เอาไว้เรียกใช้ Service CURD ที่เกี่ยวกับ Task
class TaskService {
  /// ฟังก์ชันจะค้นหา Table ที่ชื่อ tasks แล้วจึง insert ข้อมูลไปที่ Table นั้น
  ///
  /// จะทำงานต่อเมื่อกด Save ในหน้า [NewTaskScreen]
  static PostgrestFilterBuilder createTask(String title) {
    return supabase.from('tasks').insert({'title': title});
  }

  /// ฟังก์ชันจะสร้าง [Stream] ที่จะคอย Listen Table ที่ชื่อว่า Task แต่ยังไม่เริ่มทำงานนะ
  ///
  /// ส่งกลับไปให้ UI ในหน้า [HomeScreen] เรียกใช้ผ่าน Widget [StreamBuilder]
  /// ถึงจะเริ่มทำงาน
  static SupabaseStreamFilterBuilder readTasks() {
    return supabase.from("tasks").stream(primaryKey: ['id']);
  }

  /// ฟังก์ชันจะค้นหา Task ที่มี [id] ตรงกับฐานข้อมูล แล้วจึงอัพเดท isDone เป็น true
  /// และ เวลาล่าสุดที่แก้ไข
  ///
  /// จะทำงานต่อเมื่อกดที่ [ListTile] ใน [TaskCard]
  static PostgrestFilterBuilder updateTask(int id) {
    return supabase
        .from("tasks")
        .update({
          'isDone': true,
          'updatedAt': DateTime.now().toUtc().toString(),
        })
        .eq('id', id);
  }

  /// ฟังก์ชันจะค้นหา Task ที่มี [id] ตรงกับฐานข้อมูล แล้วลบทิ้ง
  ///
  /// จะทำงานต่อเมื่อ ปัดตัว [TaskCard] ไปด้านซ้าย ถึงจะเรียกใช้
  static PostgrestFilterBuilder deleteTask(int id) {
    return supabase.from("tasks").delete().eq('id', id);
  }
}
