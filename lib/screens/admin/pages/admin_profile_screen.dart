import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfa_frontend/screens/admin/widgets/appBarActionItems.dart';
import 'package:pfa_frontend/screens/admin/widgets/headerAdmin.dart';
import 'package:pfa_frontend/screens/admin/widgets/sideMenuAdmin.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/utils/style.dart';

const kLabelTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 2, 27, 154),
);

class AdminProfileScreen extends StatefulWidget {
  @override
  _AdminProfileScreenState createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  File? _image;

  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: SideMenuAdmin()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon:
                      Icon(Icons.menu, color: Color.fromARGB(255, 2, 44, 141))),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenuAdmin(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderAdmin(
                        title: 'Profil',
                      ),
                      SizedBox(
                        height: SizeConfig.getInstance().blockSizeVertical * 3,
                      ),
                      SizedBox(
                        height: SizeConfig.getInstance().blockSizeVertical * 5,
                      ),
                      buildProfileInputs(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider<Object>? _getImageProvider() {
    if (_image != null) {
      return FileImage(_image!);
    } else {
      return AssetImage('assets/admin/man.jpeg');
    }
  }

  Widget buildProfileInputs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              _getImage().then((_) {
                setState(() {});
              });
            },
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return CircleAvatar(
                  radius: 80,
                  backgroundImage: _image != null
                      ? _getImageProvider()
                      : AssetImage('assets/admin/man.jpeg'),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name:',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ahmed',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name:',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ben Ahmed',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          'Email:',
          style: kLabelTextStyle,
        ),
        SizedBox(height: 5),
        TextFormField(
          // Add controller and logic for email input
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'admin@gmail.com',
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Phone Number:',
          style: kLabelTextStyle,
        ),
        SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '25 125 255',
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
