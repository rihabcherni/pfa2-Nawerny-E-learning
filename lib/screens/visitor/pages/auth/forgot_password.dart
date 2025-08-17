import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/screens/visitor/widgets/header_auth.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:pfa_frontend/widgets/custom_button.dart';
import 'package:pfa_frontend/widgets/custom_text_field.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _forgotPassword() async {
    setState(() {
      _isLoading = true;
    });
    String apiUrl = backendUrl + '/api/auth/password-reset/';

    final Map<String, String> data = {
      'email': _emailController.text.trim(),
    };
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final message = responseData['message'];

      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.of(context).pushNamed('/teacher');
            });
            return AlertDialog(
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.72,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/account.png"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Congratulations',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .titleSize,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'forgot Password Successfully',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .textSize,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: context
                                .watch<SettingsProvider>()
                                .settings
                                .textSize,
                          ),
                          textAlign:
                              TextAlign.center, 
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SpinKitFadingCircle(
                        color: kPrimaryColor,
                        size: 40.0,
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.of(context).pop();
            });

            return AlertDialog(
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.53,
                child: Center(
                  child: Column(
                    children: [
                      Image(image: AssetImage("assets/images/account.png")),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Forgot Password Failed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .titleSize,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Failed to forgot password. Please try again.',
                        style: TextStyle(
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .textSize,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SpinKitFadingCircle(
                        color: kPrimaryColor,
                        size: 40.0,
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: SpinKitFadingCircle(
              color: kPrimaryColor,
              size: 50.0,
            ))
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HeaderAuth(
                    imageAssetPath: 'assets/images/forgot-password.png',
                    height: 200,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 50, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: context
                                  .watch<SettingsProvider>()
                                  .settings
                                  .titleSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              CustomTextField(
                                hint: 'Email',
                                controller: _emailController,
                                trailingIcon: Icons.mail,
                              ),
                              const SizedBox(height: 20),
                              CustomButton(
                                onTap: _forgotPassword,
                                isLoading: false,
                                texte: "Forgot password",
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Not a member?',
                                    style: TextStyle(color: kGrayColor),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed("/role-selection");
                                    },
                                    child: const Text(
                                      'SignUp',
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
