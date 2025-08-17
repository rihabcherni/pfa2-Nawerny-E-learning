class Category {
  final int id;
  final int courseNumber;
  final String name;
  final String icon;
  final String image;
  final String descriptionImage;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.courseNumber,
    required this.name,
    required this.icon,
    required this.image,
    required this.descriptionImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      courseNumber: json['course_number'] ?? 0,
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      image: json['image'],
      descriptionImage: json['desciption_image'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_number': courseNumber,
      'name': name,
      'icon': icon,
      'image': image,
      'description_image': descriptionImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
