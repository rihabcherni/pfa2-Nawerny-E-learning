import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/services/visitor/category_cours_service.dart';
import 'package:pfa_frontend/utils/color.dart';

class CoursesCategoryScreen extends StatefulWidget {
  final int categoryId;

  const CoursesCategoryScreen({required this.categoryId});

  @override
  _CoursesCategoryScreenState createState() => _CoursesCategoryScreenState();
}

class _CoursesCategoryScreenState extends State<CoursesCategoryScreen> {
  late Future<List<Course>> _futureCourses;

  @override
  void initState() {
    super.initState();
    _futureCourses =
        CategoryCoursVisitorService.getCoursesByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Course>>(
        future: _futureCourses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final course = snapshot.data![index];
                return ListTile(
                  title: Text(course.titre),
                  subtitle: Text(course.description),
                  onTap: () {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
