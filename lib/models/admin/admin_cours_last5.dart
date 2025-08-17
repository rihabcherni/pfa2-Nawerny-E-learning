import 'package:intl/intl.dart';

class AdminCourseLast5 {
  final int id;
  final String title;
  final String coursePhoto;
  final String category;
  final String description;
  final String language;
  final String level;
  final String author;
  final String authorPhoto;
  final String createdAt;

  AdminCourseLast5({
    required this.id,
    required this.title,
    required this.coursePhoto,
    required this.category,
    required this.description,
    required this.language,
    required this.level,
    required this.author,
    required this.authorPhoto,
    required this.createdAt,
  });

  factory AdminCourseLast5.fromJson(Map<String, dynamic> json) {
    final DateTime parsedDate = DateTime.parse(json['created_at']);
    final String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm').format(parsedDate);
    return AdminCourseLast5(
      id: json['id'],
      title: json['title'],
      coursePhoto: json['cours_photo'] ?? 'assets/course/default-cours.jpg',
      category: json['category'],
      description: json['description'],
      language: json['langue'],
      level: json['niveau'],
      author: json['auteur'],
      authorPhoto: json['author_photo'] ?? 'assets/images/account.png',
      createdAt: formattedDate,
    );
  }
}
