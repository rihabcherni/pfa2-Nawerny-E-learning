import 'package:flutter/material.dart';

class Drawer_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Jhon Doe'),
            accountEmail: Text('John@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/account.png', 
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 47, 87),
              
            ),
          ),
          buildListTile('Cours', Icons.cast_for_education_outlined, () {
            Navigator.pop(context);
          }),
          buildListTile('Etudiants', Icons.school, () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/Etudiant');
          }),
          buildListTile('Profile', Icons.person, () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/profile');
          }),
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
