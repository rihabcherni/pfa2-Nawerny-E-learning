import 'package:intl/intl.dart';

class LessonOnly {
  final int id;
  final String titre;
  final String createdAt;
  final DateTime updatedAt;
  final int cours;

  LessonOnly({
    required this.id,
    required this.titre,
    required this.createdAt,
    required this.updatedAt,
    required this.cours,
  });

  factory LessonOnly.fromJson(Map<String, dynamic> json) {
    final DateTime parsedDate = DateTime.parse(json['created_at']);
    final String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm').format(parsedDate);
    return LessonOnly(
      id: json['id'],
      titre: json['titre'],
      createdAt: formattedDate,
      updatedAt: DateTime.parse(json['updated_at']),
      cours: json['cours'],
    );
  }
}

class LessonDetails {
  final int id;
  final int imageNumber;
  final int audioNumber;
  final int videoNumber;
  final int textNumber;
  final List<LessonContent> content;
  final String titre;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int cours;

  LessonDetails({
    required this.id,
    required this.imageNumber,
    required this.audioNumber,
    required this.videoNumber,
    required this.textNumber,
    required this.content,
    required this.titre,
    required this.createdAt,
    required this.updatedAt,
    required this.cours,
  });

  factory LessonDetails.fromJson(Map<String, dynamic> json) {
    List<LessonContent> allContent = [];
    allContent.addAll(List<LessonText>.from(
        json['contenu_texts'].map((x) => LessonText.fromJson(x))));

    allContent.addAll(List<LessonImage>.from(
        json['contenu_images'].map((x) => LessonImage.fromJson(x))));

    allContent.addAll(List<LessonVideo>.from(
        json['contenu_videos'].map((x) => LessonVideo.fromJson(x))));
    allContent.addAll(List<LessonAudio>.from(
        json['contenu_audio'].map((x) => LessonAudio.fromJson(x))));

    allContent.sort((a, b) => a.ordre.compareTo(b.ordre));

    return LessonDetails(
      id: json['id'],
      imageNumber: json['image_number'],
      audioNumber: json['audio_number'],
      videoNumber: json['video_number'],
      textNumber: json['texte_number'],
      content: allContent,
      titre: json['titre'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      cours: json['cours'],
    );
  }
}

abstract class LessonContent {
  final int ordre;

  LessonContent({
    required this.ordre,
  });
}

class LessonText extends LessonContent {
  final int id;
  final String titre;
  final String texte;
  final int lecon;

  LessonText({
    required this.id,
    required this.titre,
    required this.texte,
    required this.lecon,
    required int ordre,
  }) : super(ordre: ordre);

  factory LessonText.fromJson(Map<String, dynamic> json) {
    return LessonText(
      id: json['id'],
      titre: json['titre'],
      texte: json['texte'],
      lecon: json['lecon'],
      ordre: json['ordre'],
    );
  }
}

class LessonImage extends LessonContent {
  final int id;
  final String titre;
  final String? lienImage;
  final String desciptionImage;
  final int lecon;

  LessonImage({
    required this.id,
    required this.titre,
    required this.lienImage,
    required this.desciptionImage,
    required this.lecon,
    required int ordre,
  }) : super(ordre: ordre);

  factory LessonImage.fromJson(Map<String, dynamic> json) {
    return LessonImage(
      id: json['id'],
      titre: json['titre'],
      lienImage: json['lien_image'],
      desciptionImage: json['desciption_image'],
      lecon: json['lecon'],
      ordre: json['ordre'],
    );
  }
}

class LessonVideo extends LessonContent {
  final int id;
  final String titre;
  final String lienVideo;
  final String desciptionVideo;
  final int lecon;

  LessonVideo({
    required this.id,
    required this.titre,
    required this.lienVideo,
    required this.desciptionVideo,
    required this.lecon,
    required int ordre,
  }) : super(ordre: ordre);

  factory LessonVideo.fromJson(Map<String, dynamic> json) {
    return LessonVideo(
      id: json['id'],
      titre: json['titre'],
      lienVideo: json['lien_video'],
      desciptionVideo: json['desciption_video'],
      lecon: json['lecon'],
      ordre: json['ordre'],
    );
  }
}

class LessonAudio extends LessonContent {
  final int id;
  final String titre;
  final String lienAudio;
  final String desciptionAudio;
  final int lecon;

  LessonAudio({
    required this.id,
    required this.titre,
    required this.lienAudio,
    required this.desciptionAudio,
    required this.lecon,
    required int ordre,
  }) : super(ordre: ordre);

  factory LessonAudio.fromJson(Map<String, dynamic> json) {
    return LessonAudio(
      id: json['id'],
      titre: json['titre'],
      lienAudio: json['lien_audio'],
      desciptionAudio: json['desciption_audio'],
      lecon: json['lecon'],
      ordre: json['ordre'],
    );
  }
}
