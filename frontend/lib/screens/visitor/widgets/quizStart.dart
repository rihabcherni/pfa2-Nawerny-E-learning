import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/student/pages/quiz_screen.dart';
import 'package:pfa_frontend/utils/color.dart';

class QuizStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Quiz! Ready to start',
              style: TextStyle(fontSize: 22, color: kPrimaryColor),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
