import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/admin/pages/admin_dashboard_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/admin_profile_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/teachers_admin_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/courses_admin_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/students_admin_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/all_course.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/size_config.dart';

class SideMenuAdmin extends StatelessWidget {
  const SideMenuAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.getInstance().screenHeight,
        decoration: BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              IconButton(
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.home,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminDashboardScreen(),
                        ));
                  }),
              IconButton(
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.school,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Students(),
                        ));
                  }),
              IconButton(
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.people,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Authors(),
                        ));
                  }),
              IconButton(
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.book_rounded,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Courses(),
                        ));
                  }),
              IconButton(
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.manage_accounts,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminProfileScreen(),
                        ));
                  }),
              IconButton(
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.logout,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("Logout successful"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllCourseScreen(),
                                    ));
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
