class Cours {
  final int id;
  final String titre;
  final List<Content> contents;
  final String description;
  final String cours_photo;
  final DateTime date;
  final double rating;
  final int numRated;
  final String categorie;
  final String niveau;

  Cours({
    required this.id,
    required this.titre,
    required this.contents,
    required this.description,
    required this.cours_photo,
    required this.date,
    required this.rating,
    required this.numRated,
    required this.categorie,
    required this.niveau,
  });

  factory Cours.fromJson(Map<String, dynamic> json) {
    return Cours(
      id: json['id'] ?? 0, 
      titre: json['titre'] ?? '',
      contents: (json['contents'] as List<dynamic>?)?.map((contentJson) {
            final contentType = ContentType.values[contentJson['contentType']];
            switch (contentType) {
              case ContentType.Text:
                return ContenuTexte.fromJson(contentJson);
              case ContentType.Image:
                return ContenuImage.fromJson(contentJson);
              case ContentType.Video:
                return ContenuVideo.fromJson(contentJson);
              case ContentType.Audio:
                return ContenuAudio.fromJson(contentJson);
              default:
                throw Exception('Unknown content type: $contentType');
            }
          }).toList() ??
          [], 
      description:
          json['description'] ?? '', 
      cours_photo:
          json['cours_photo'] ?? '', 
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(), 
      rating: json['rating']?.toDouble() ??
          0.0, 
      numRated: json['numRated'] ?? 0, 
      categorie:
          json['categorie'] ?? '', 
      niveau: json['niveau'] ?? '', 
    );
  }
}

enum ContentType {
  Text,
  Image,
  Video,
  Audio,
}

abstract class Content {
  final int id;
  final String titre;
  final String description;
  final int lessonId;

  Content({
    required this.id,
    required this.titre,
    required this.description,
    required this.lessonId,
  });
}

class ContenuTexte extends Content {
  final String texte;

  ContenuTexte({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.texte,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuTexte fromJson(contentJson) {
    return ContenuTexte(
      id: contentJson['id'] ?? 0, 
      titre:
          contentJson['titre'] ?? '', 
      description: contentJson['description'] ??
          '', 
      lessonId: contentJson['lessonId'] ??
          0, 
      texte:
          contentJson['texte'] ?? '', 
    );
  }
}

class ContenuImage extends Content {
  final String imageUrl;

  ContenuImage({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.imageUrl,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuImage fromJson(contentJson) {
    return ContenuImage(
      id: contentJson['id'] ?? 0, 
      titre:
          contentJson['titre'] ?? '', 
      description: contentJson['description'] ??
          '', 
      lessonId: contentJson['lessonId'] ??
          0, 
      imageUrl: contentJson['imageUrl'] ??
          '', 
    );
  }
}

class ContenuVideo extends Content {
  final String videoUrl;

  ContenuVideo({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.videoUrl,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuVideo fromJson(contentJson) {
    return ContenuVideo(
      id: contentJson['id'] ?? 0, 
      titre:
          contentJson['titre'] ?? '', 
      description: contentJson['description'] ??
          '', 
      lessonId: contentJson['lessonId'] ??
          0, 
      videoUrl: contentJson['videoUrl'] ??
          '', 
    );
  }
}

class ContenuAudio extends Content {
  final String audioUrl;

  ContenuAudio({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.audioUrl,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuAudio fromJson(contentJson) {
    return ContenuAudio(
      id: contentJson['id'] ?? 0, 
      titre:
          contentJson['titre'] ?? '', 
      description: contentJson['description'] ??
          '', 
      lessonId: contentJson['lessonId'] ??
          0, 
      audioUrl: contentJson['audioUrl'] ??
          '', 
    );
  }
}
