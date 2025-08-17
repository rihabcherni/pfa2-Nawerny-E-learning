import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_frontend/controllers/question_controller.dart';
import 'package:pfa_frontend/screens/student/pages/score_screen.dart';
import 'package:pfa_frontend/screens/student/widgets/quiz/body.dart';
import 'package:pfa_frontend/screens/visitor/pages/loading_screen.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
          TextButton(
            onPressed: () {
             showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('End Quiz?'),
                    content: Text('Are you sure you want to end the quiz?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScoreScreen(),
                            ),
                          );
                        },
                        child: Text('End'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("end"),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
