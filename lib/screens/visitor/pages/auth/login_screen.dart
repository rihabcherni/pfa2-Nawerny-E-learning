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
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../widgets/message_popup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    String apiUrl = backendUrl + '/api/auth/login/';
    final Map<String, String> data = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
    };
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final authToken = responseData['access_token'];
      final refreshAuthToken = responseData['refresh_token'];
      final userType = responseData['type_user'];
      final fullName = responseData['full_name'];
      final email = responseData['email'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', authToken);
      prefs.setString('refreshAuthToken', refreshAuthToken);
      prefs.setBool('isLoggedIn', true);
      prefs.setString('userType', userType);
      prefs.setString('full_name', fullName);
      prefs.setString('email', email);

      showDialog(
        context: context,
        builder: (context) {
          loggedLink(userType, context);
          return MessagePopup(
            imageAssetPath: "assets/images/account.png",
            title: "Congratulations: Login Successfully",
            text:
                'Welcome ${responseData['full_name']}. You will be redirected to the Home Page in a few seconds.',
            height: 0.60,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
          return MessagePopup(
            imageAssetPath: "assets/images/account.png",
            title: "Error: Login Failed",
            text: 'Failed to login. Please try again.',
            height: 0.55,
          );
        },
      );
    }
  }

  Future<Null> loggedLink(userType, BuildContext context) {
    return Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();

      switch (userType) {
        case 'admin':
          Navigator.of(context).pushNamed('/admin');
          break;
        case 'auteur':
          Navigator.of(context).pushNamed('/teacher');
          break;
        case 'apprenant':
          Navigator.of(context).pushNamed('/student');
          break;
        default:
          Navigator.of(context).pushNamed('/');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: Semantics(
                label: 'Loading',
                child: SpinKitFadingCircle(
                  color: kPrimaryColor,
                  size: 50.0,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Semantics(
                    label: 'Login Page Header with simple image for design',
                    child: HeaderAuth(
                      imageAssetPath: 'assets/images/backlogin.png',
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
                            "Login",
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
                              const SizedBox(height: 20),
                              CustomTextField(
                                hint: 'Email',
                                controller: _emailController,
                                trailingIcon: Icons.mail,
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                hint: 'Password',
                                controller: _passwordController,
                                obscureText: true,
                                trailingIcon: Icons.lock,
                              ),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/forgot-password');
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: kPrimaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomButton(
                                onTap: _login,
                                isLoading: false,
                                texte: "Login",
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
