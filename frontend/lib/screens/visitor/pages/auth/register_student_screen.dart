import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/screens/visitor/widgets/header_auth.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:pfa_frontend/widgets/custom_button.dart';
import 'package:pfa_frontend/widgets/custom_text_field.dart';
import 'package:pfa_frontend/widgets/message_popup.dart';
import 'package:provider/provider.dart';

class RegisterStudentScreen extends StatefulWidget {
  const RegisterStudentScreen({Key? key}) : super(key: key);
  @override
  _RegisterStudentScreenState createState() => _RegisterStudentScreenState();
}

class _RegisterStudentScreenState extends State<RegisterStudentScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });
    String apiUrl = backendUrl + '/api/auth/register/';
    final Map<String, String> data = {
      'first_name': _firstNameController.text.trim(),
      'last_name': _lastNameController.text.trim(),
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
      'password2': _password2Controller.text.trim(),
      'type_user': "apprenant",
    };
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final fullName = responseData['data']['first_name'] +
          " " +
          responseData['data']['last_name'];
      final email = responseData['data']['email'];
      final userType = "apprenant";
      showDialog(
          context: context,
          builder: (context) {
            registerLink(userType, email, context);
            return MessagePopup(
              imageAssetPath: "assets/images/account.png",
              title: "Congratilations: Register Student Successfuly",
              text: 'Welcome ${fullName} ${responseData["message"]}',
              height: 0.70,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.of(context).pop();
            });

            return MessagePopup(
              imageAssetPath: "assets/images/account.png",
              title: "Error: Register Student Failed",
              text: 'Register Student falied please try again',
              height: 0.65,
            );
          });
    }
  }

  Future<Null> registerLink(userType, email, BuildContext context) {
    return Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(
        '/verify-email',
        arguments: {'email': email},
      );
    });
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
                  Semantics(
                    label: 'Register Page Header',
                    child: HeaderAuth(
                      imageAssetPath: 'assets/images/register.png',
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 50, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: kBlackColor,
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
                              const SizedBox(height: 8),
                              CustomTextField(
                                  hint: 'FirstName',
                                  controller: _firstNameController,
                                  trailingIcon: Icons.face),
                              const SizedBox(height: 8),
                              CustomTextField(
                                hint: 'LastName',
                                controller: _lastNameController,
                                trailingIcon: Icons.face,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                hint: 'Email',
                                controller: _emailController,
                                trailingIcon: Icons.mail,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                hint: 'Password',
                                controller: _passwordController,
                                trailingIcon: Icons.lock_person,
                                obscureText: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                hint: 'Confirm Password',
                                controller: _password2Controller,
                                obscureText: true,
                                trailingIcon: Icons.lock_person,
                              ),
                              const SizedBox(height: 7),
                              CustomButton(
                                onTap: _register,
                                isLoading: false,
                                texte: "Register",
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'You are a member?',
                                    style: TextStyle(color: kGrayColor),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed("/login");
                                    },
                                    child: const Text(
                                      'SignIn',
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
