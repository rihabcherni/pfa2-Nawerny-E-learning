import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/Enseignant.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class EnseignantInfoScreen extends StatelessWidget {
  final Enseignant enseignant;

  const EnseignantInfoScreen({Key? key, required this.enseignant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enseignant Information',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.watch<SettingsProvider>().settings.subTitleSize,
            fontWeight: FontWeight.bold, 
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.id}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.smallTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'CIN:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.cin}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Nom:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.nom}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Prénom:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.prenom}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Email:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.email}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Age:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.age}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Numéro de Téléphone:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.numTel}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Adresse:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.adresse}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
            SizedBox(height: 16), 
            Text(
              'Spécialité:',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black54), 
            ),
            Text(
              '${enseignant.specialite}',
              style: TextStyle(
                  fontSize:
                      context.watch<SettingsProvider>().settings.bigTextSize,
                  color: Colors.black87), 
            ),
          ],
        ),
      ),
    );
  }
}
