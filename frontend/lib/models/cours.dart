import 'package:intl/intl.dart';

class Review {
  final int id;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final int cours;
  final int apprenant;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.cours,
    required this.apprenant,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createAt']),
      cours: json['cours'],
      apprenant: json['apprenant'],
    );
  }
}

class Course {
  final int id;
  final int leconNumber;
  final int totalRatings;
  final int totalReviews;
  final String titre;
  final String coursPhoto;
  final String description;
  final String langue;
  final String niveau;
  late final String createdAt;
  final String category;
  final String auteur;
  final String auteurPhoto;

  Course({
    required this.id,
    required this.leconNumber,
    required this.totalRatings,
    required this.totalReviews,
    required this.titre,
    required this.coursPhoto,
    required this.description,
    required this.langue,
    required this.niveau,
    required this.createdAt,
    required this.category,
    required this.auteur,
    required this.auteurPhoto,
  });

  double get ratingValue {
    if (totalReviews == 0) {
      return 0.0;
    }
    return totalRatings / totalReviews;
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    final DateTime parsedDate = DateTime.parse(json['created_at']);
    final String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm').format(parsedDate);
    return Course(
      id: json['id'],
      leconNumber: json['lecon_number'],
      totalRatings: json['total_ratings'],
      totalReviews: json['total_reviews'],
      titre: json['titre'],
      coursPhoto: json['cours_photo'] ?? 'assets/course/default-cours.jpg',
      description: json['description'],
      langue: json['langue'],
      niveau: json['niveau'],
      createdAt: formattedDate,
      category: json['category'],
      auteur: json['auteur'],
      auteurPhoto: json['auteur_photo'] ?? 'assets/images/account.png',
    );
  }
}
