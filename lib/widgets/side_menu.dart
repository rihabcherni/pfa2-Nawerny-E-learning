import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/logout.dart';
import 'package:pfa_frontend/utils/auth_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final refreshAuthToken = context.watch<AuthProvider>().refreshAuthToken;
    final authToken = context.watch<AuthProvider>().authToken;
    final userType = context.watch<AuthProvider>().userType;
    final email = context.watch<AuthProvider>().email;
    final fullName = context.watch<AuthProvider>().fullName;

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(fullName!),
            accountEmail: Text(email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
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
            },
          ),
         
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("logout"),
            onTap: () {
              logoutUser(
                  context, refreshAuthToken!, authToken!);
            },
          ),
        ],
      ),
    );
  }
}
