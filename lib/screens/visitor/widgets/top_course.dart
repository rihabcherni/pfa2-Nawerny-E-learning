import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';

class TopCourseScreen extends StatelessWidget {
  const TopCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text('Top courses'),
      ),
    );
  }
}
