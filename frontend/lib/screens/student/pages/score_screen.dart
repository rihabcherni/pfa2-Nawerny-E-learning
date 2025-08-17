import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              SizedBox(height: 80),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/score.png",
                    width: 200,
                    height: 200,
                  )),
              SizedBox(height: 30),
              Text(
                "Your Score is:",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: kPrimaryColor),
              ),
              SizedBox(height: 20),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: kSecondaryColor),
              ),
              SizedBox(height: 20),
              Material(
                color: Color.fromARGB(255, 2, 44, 141),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/all-courses');
                  },
                  child: Semantics(
                    label: 'Click here to ',
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 80,
                      ),
                      child: Text(
                        "Terminate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .bigTextSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
