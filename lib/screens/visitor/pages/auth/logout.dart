import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logoutUser(
    BuildContext context, String refreshToken, String authToken) async {
  final url = Uri.parse(backendUrl + '/api/auth/logout/');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $authToken',
  };
  final body = jsonEncode({'refresh_token': refreshToken});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print('Logout successful');
      SharedPreferences.getInstance().then((prefs) => prefs.clear());
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pushNamed('/');
            });
            return AlertDialog(
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.52,
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
                        'Logout Successfully',
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
      print('Logout failed');
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.of(context).pushNamed('/');
            });
            return AlertDialog(
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.52,
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
                        'Error',
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
                        'Logout Failed',
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
    }
  } catch (error) {
    print('Error occurred: $error');
  }
}
