import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/admin/widgets/appBarActionItems.dart';
import 'package:pfa_frontend/screens/admin/widgets/headerAdmin.dart';
import 'package:pfa_frontend/screens/admin/widgets/sideMenuAdmin.dart';
import 'package:pfa_frontend/screens/admin/widgets/teachersTable.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';

class Authors extends StatelessWidget {
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
                          title: 'Authors',
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getInstance().blockSizeVertical * 3,
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getInstance().blockSizeVertical * 5,
                        ),
                        TeachersTable(),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
