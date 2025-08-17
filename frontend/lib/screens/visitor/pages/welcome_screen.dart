import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Semantics(
                label: 'Blue Background',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              Semantics(
                label: 'Image Background',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 44, 141),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                    child: ExcludeSemantics(
                      child: Image.asset(
                        "assets/books.png",
                        scale: 0.9,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Semantics(
                  label: 'Bottom Background',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.666,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 44, 141),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.666,
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Semantics(
                        label:
                            'Learning is Everything. Welcome to Nawerny E-Learning application, a platform designed to provide educational resources for people with disabilities.',
                        child: Column(
                          children: [
                            Text(
                              "Learning is Everything",
                              style: TextStyle(
                                fontSize: context
                                    .watch<SettingsProvider>()
                                    .settings
                                    .subTitleSize,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                wordSpacing: 2,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Welcome to Nawerny E-Learning application, a platform designed to provide educational resources for people with disabilities.',
                                style: TextStyle(
                                  fontSize: context
                                      .watch<SettingsProvider>()
                                      .settings
                                      .textSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                                "Get Start",
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


