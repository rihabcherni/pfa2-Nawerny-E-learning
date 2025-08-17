import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/Enseignant.dart';
import 'package:pfa_frontend/screens/teacher/pages/InfoProfileScreen.dart';
import 'package:pfa_frontend/screens/teacher/pages/UpdateProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Text('Profile', style: Theme.of(context).textTheme.headline4),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/images/account.png')),
                    ),
                  ),
                
                ],
              ),
              const SizedBox(height: 10),
              Text('Jhon Doe',
                  style: Theme.of(context).textTheme.headline4),
              Text('Jhon@gamil.com ',
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => UpdateProfileScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Edit Profile',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 10),

              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  icon: Icons.info,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnseignantInfoScreen(
                                  enseignant: Enseignant(
                                id: 1,
                                cin: '1234567890',
                                nom: 'John',
                                prenom: 'Doe',
                                email: 'john.doe@example.com',
                                age: 35,
                                pwd: 'password123',
                                numTel: '1234567890',
                                adresse: '123 Main Street',
                                specialite: 'Mathematics',
                              ))),
                    );
                  }),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("LOGOUT"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color textColor;
  final bool endIcon;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor = Colors.black,
    this.endIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: textColor)),
      leading: Icon(icon),
      trailing: endIcon ? const Icon(Icons.arrow_forward_ios) : null,
      onTap: onPress,
    );
  }
}
