class AdminCount {
  final int adminCount;
  final int studentCount;
  final int teacherCount;
  final int courseCount;
  final int categoryCount;

  AdminCount({
    required this.adminCount,
    required this.studentCount,
    required this.teacherCount,
    required this.courseCount,
    required this.categoryCount,
  });

  factory AdminCount.fromJson(Map<String, dynamic> json) {
    return AdminCount(
      adminCount: json['admin_count'],
      studentCount: json['student_count'],
      teacherCount: json['teacher_count'],
      courseCount: json['course_count'],
      categoryCount: json['category_count'],
    );
  }
}
