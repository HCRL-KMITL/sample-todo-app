import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';

/// ใช้ [Future] เพื่อทำให้ Function[main] เป็น asynchronous
Future<void> main() async {
  /* 
    เรียกเพื่อทำให้แน่ใจว่า Flutter Framework พร้อมใช้งาน
    โดยปกติจะถูกเรียกอัตโนมัติอยู่แล้วที่ฟังก์ชัน runApp()
    แต่ที่เรียกก่อนเพราะเราต้องการ initialize package อื่นๆก่อน
  */
  WidgetsFlutterBinding.ensureInitialized();

  /*
    โหลด non secret key จาก .env
    ห้ามเก็บ secret key ต่างๆไว้เด็ดขาด!!!
    มีไว้เก็บ publishable key, api key ฝั่ง client อย่างน้อยป้องกันได้ระดับนึง
  */
  await dotenv.load(fileName: ".env");

  /* ประกาศ instance ของ supabase */
  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"] ?? "",
    anonKey: dotenv.env["SUPABASE_PUBLISHABLE_KEY"] ?? "",
  );

  /* Entry Point สำหรับ rendering Widget แรกขึ้นหน้าจอ */
  runApp(const ToDoApp());
}
