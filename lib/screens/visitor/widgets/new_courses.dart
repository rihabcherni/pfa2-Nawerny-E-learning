import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/services/visitor/cours_visitor_service.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class NewCourseScreen extends StatelessWidget {
  final CoursesVisitorService _coursesVisitorService = CoursesVisitorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Course>>(
        future: _coursesVisitorService.fetchList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final courses = snapshot.data!;
            courses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
            final lastThreeCourses = courses.take(3).toList();

            return ListView.builder(
              itemCount: lastThreeCourses.length,
              itemBuilder: (context, index) {
                final course = lastThreeCourses[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            course.coursPhoto,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Text(course.titre),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description: ${course.description}'),
                              SizedBox(height: 4),
                              Text('Language: ${course.langue}'),
                              SizedBox(height: 4),
                              Text('Level: ${course.niveau}'),
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Text(course.createdAt),
                              Row(
                                children: [],
                              ),
                              RatingBar.builder(
                                initialRating:
                                    courses[index].totalRatings == 0 &&
                                            courses[index].totalReviews == 0
                                        ? 0.0
                                        : double.parse(
                                            (courses[index].totalRatings /
                                                    courses[index].totalReviews)
                                                .toStringAsFixed(2)),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 13,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.2),
                                itemBuilder: (context, _) => Icon(
                                  semanticLabel: 'Ratting star',
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Text(
                                '(${courses[index].totalRatings == 0 && courses[index].totalReviews == 0 ? 0 : courses[index].totalReviews})',
                                style: TextStyle(
                                  fontSize: context
                                      .watch<SettingsProvider>()
                                      .settings
                                      .textSize,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
