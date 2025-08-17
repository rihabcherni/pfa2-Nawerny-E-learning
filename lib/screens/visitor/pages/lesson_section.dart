import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/Lecons.dart';
import 'package:pfa_frontend/screens/visitor/widgets/Lesson_details_screen.dart';
import 'package:pfa_frontend/services/visitor/lecons_visitor_service.dart';

class LessonSection extends StatefulWidget {
  final int courseId;

  const LessonSection({Key? key, required this.courseId}) : super(key: key);

  @override
  _LessonSectionState createState() => _LessonSectionState();
}

class _LessonSectionState extends State<LessonSection> {
  late Future<List<LessonOnly>> _lessonsFuture;
  final LessonService _lessonService = LessonService();

  @override
  void initState() {
    super.initState();
    _lessonsFuture = _lessonService.fetchLessons(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LessonOnly>>(
      future: _lessonsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final List<LessonOnly> lessons = snapshot.data!;
          return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final LessonOnly lesson = lessons[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LessonDetailsScreen(lessonId: lesson.id),
                    ),
                  );
                },
                child: Semantics(
                  label: 'Lesson ${index + 1}: ${lesson.titre}',
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? const Color.fromARGB(255, 2, 44, 141)
                            : const Color.fromARGB(255, 2, 44, 141)
                                .withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    title: Text(lesson.titre),
                    subtitle: Text(lesson.createdAt.toString()),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
