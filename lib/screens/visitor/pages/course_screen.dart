import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/screens/visitor/pages/lesson_section.dart';
import 'package:pfa_frontend/screens/visitor/widgets/quizStart.dart';
import 'package:pfa_frontend/services/visitor/cours_details_visitor_service.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/screens/student/widgets/description_section.dart';
import 'package:pfa_frontend/screens/student/pages/quiz_screen.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  final int courseId;
  CourseScreen(this.courseId, {Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final CourseDetailsVisitorService _courseService =
      CourseDetailsVisitorService();
  String selectedSection = 'lesson';
  Course? _course;

  @override
  void initState() {
    super.initState();
    fetchCourseDetails();
  }

  void fetchCourseDetails() async {
    try {
      Course course = await _courseService.fetchCourseById(widget.courseId);
      setState(() {
        _course = course;
      });
    } catch (e) {
      print('Error fetching course details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_course == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading course...'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Semantics(
          label: 'Course title',
          child: Text(
            _course!.titre.toString() + " Complete Course",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        actions: [
          Semantics(
            label: 'Notifications icon',
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications,
                size: 28,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              label: 'Course Image',
              child: Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F3FF),
                  image: DecorationImage(
                    image: NetworkImage(_course!.coursPhoto),
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Color.fromARGB(255, 2, 44, 141),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _course!.leconNumber.toString() + " lessons",
              style: TextStyle(
                fontSize: context.watch<SettingsProvider>().settings.textSize,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSection = 'lesson';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSection == 'lesson'
                          ? kPrimaryColor
                          : Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Lessons",
                      style: TextStyle(
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .textSize,
                          fontWeight: FontWeight.w500,
                          color: selectedSection == 'lesson'
                              ? Colors.white
                              : kPrimaryColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSection = 'description';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSection == 'description'
                          ? kPrimaryColor
                          : Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .textSize,
                          fontWeight: FontWeight.w500,
                          color: selectedSection == 'description'
                              ? Colors.white
                              : kPrimaryColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSection = 'quiz';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSection == 'quiz'
                          ? kPrimaryColor
                          : Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Quiz",
                      style: TextStyle(
                        fontSize:
                            context.watch<SettingsProvider>().settings.textSize,
                        fontWeight: FontWeight.w500,
                        color: selectedSection == 'quiz'
                            ? Colors.white
                            : kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _buildSection(selectedSection),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String section) {
    switch (section) {
      case 'lesson':
        return LessonSection(
          courseId: _course!.id,
        );
      case 'description':
        return DescriptionSection();
      case 'quiz':
        return QuizStartScreen();
      default:
        return Container();
    }
  }
}
