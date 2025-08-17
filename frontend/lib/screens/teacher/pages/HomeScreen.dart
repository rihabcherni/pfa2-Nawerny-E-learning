import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/teacher/widgets/home/Drawer_widget.dart';
import 'package:pfa_frontend/screens/teacher/widgets/home/HomeBody.dart';
import 'package:pfa_frontend/utils/color.dart';

class HomeScreenTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: HomeAppBar(),
      body: HomeBody(),
      drawer: Drawer_widget(),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'My courses',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'YourCustomFont',
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
