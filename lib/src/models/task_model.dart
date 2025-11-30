/// Model [TaskModel] สร้างให้ตรงกับ name column ใน Table tasks ของ Supabase
///
/// [id] - ระบุ id ของ task
///
/// [title] - หัวข้อของ task
///
/// [isDone] - task นั้นเสร็จไปแล้วหรือยัง
///
/// [createdAt] - task นั้นสร้างขึ้นเมื่อไหร่
///
/// [updatedAt] - task นั้นอัพเดทล่าสุดเมื่อไหร่
///
/// [TaskModel.fromJson] รับ parameter เป็น Map ที่ยังไม่ถูก Format เป็น type ต่างๆ
/// มาแปลงเป็น type [TaskModel] แล้ว return กลับไป
class TaskModel {
  final int id;
  final String title;
  final bool isDone;
  final String createdAt;
  final String updatedAt;

  const TaskModel({
    required this.id,
    required this.title,
    required this.isDone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? "",
      isDone: json['isDone'] ?? false,
      createdAt: json['createdAt'] ?? DateTime.now().toUtc().toString(),
      updatedAt: json['updatedAt'] ?? DateTime.now().toUtc().toString(),
    );
  }
}
