import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pfa_frontend/models/teacher/etudiant.dart';
import 'package:pfa_frontend/screens/teacher/pages/EditEtudiantScreen.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class EtudiantScreen extends StatefulWidget {
  const EtudiantScreen({Key? key}) : super(key: key);

  @override
  State<EtudiantScreen> createState() => EtudiantScreenState();
}

class EtudiantScreenState extends State<EtudiantScreen> {
  final List<Etudiant> etudiants = [
    Etudiant(
      id: 1,
      cin: '12345678',
      nom: 'Doe',
      prenom: 'John',
      email: 'john.doe@example.com',
      age: 25,
      pwd: 'password123',
      numTel: '1234567890',
      adresse: '123 Main Street',
    ),
    Etudiant(
      id: 2,
      cin: '87654321',
      nom: 'Smith',
      prenom: 'Jane',
      email: 'jane.smith@example.com',
      age: 28,
      pwd: 'password456',
      numTel: '0987654321',
      adresse: '456 Elm Street',
    ),
    Etudiant(
      id: 3,
      cin: '13579246',
      nom: 'Brown',
      prenom: 'Mike',
      email: 'mike.brown@example.com',
      age: 22,
      pwd: 'password789',
      numTel: '1357924680',
      adresse: '789 Oak Street',
    ),
    Etudiant(
      id: 4,
      cin: '24681357',
      nom: 'Garcia',
      prenom: 'Maria',
      email: 'maria.garcia@example.com',
      age: 24,
      pwd: 'passwordabc',
      numTel: '2468135790',
      adresse: '987 Pine Street',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etudiant Screen'),
      ),
      body: (etudiants.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hourglass_empty_rounded,
                    color: Colors.grey,
                    size: 60.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'No etudiant...',
                    style: TextStyle(
                        fontSize: context
                            .watch<SettingsProvider>()
                            .settings
                            .titleSize,
                        color: Colors.grey),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: etudiants.length,
              itemBuilder: (context, index) {
                final etudiant = etudiants[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actions: [
                      IconSlideAction(
                        caption: 'Edit',
                        color: Colors.blue,
                        icon: Icons.edit,
                        onTap: () => _editEtudiant(context, etudiant),
                      ),
                    ],
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => _deleteEtudiant(index),
                      ),
                    ],
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(etudiant.nom[0] + etudiant.prenom[0]),
                      ),
                      title: Text('${etudiant.nom} ${etudiant.prenom}'),
                      subtitle: Text(etudiant.email),
                      onTap: () => _showDetails(context, etudiant),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _editEtudiant(BuildContext context, Etudiant etudiant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEtudiantScreen(etudiant: etudiant),
      ),
    );
  }

  void _deleteEtudiant(int index) {
    setState(() {
      etudiants.removeAt(index);
    });
  }

  void _showDetails(BuildContext context, Etudiant etudiant) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Etudiant Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nom: ${etudiant.nom}'),
              Text('Prenom: ${etudiant.prenom}'),
              Text('Email: ${etudiant.email}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
