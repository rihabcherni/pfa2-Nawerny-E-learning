import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/visitor/widgets/header_auth.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Semantics(
              label: 'Page Header with simple image for design',
              child: HeaderAuth(
                imageAssetPath: 'assets/images/role.png',
                height: 180,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Your Role',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.titleSize,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customIconRole(context, "Student", kPrimaryColor),
                SizedBox(width: 30),
                customIconRole(context, "Teacher", kSecondColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox customIconRole(BuildContext context, String role, Color color) {
    return SizedBox.fromSize(
      size: Size(160, 160),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: role == "Student"
                  ? [color, Color.fromRGBO(143, 148, 251, 1)]
                  : [Color.fromRGBO(143, 148, 251, 1), color],
            ),
          ),
          child: InkWell(
            splashColor: kDefaultIconLightColor,
            onTap: () => _registerRole(context, role),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  role == "Student" ? Icons.people : Icons.school,
                  size: 80,
                  color: kWhiteColor,
                ), 
                Text(
                  role,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: context
                          .watch<SettingsProvider>()
                          .settings
                          .bigTextSize,
                      fontWeight: FontWeight.bold),
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerRole(BuildContext context, String role) {
    if (role == "Student") {
      Navigator.of(context).pushNamed('/register-student');
    } else {
      Navigator.of(context).pushNamed('/register-teacher');
    }
  }
}

