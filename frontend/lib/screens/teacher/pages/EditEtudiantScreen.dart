import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/etudiant.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';

class EditEtudiantScreen extends StatefulWidget {
  final Etudiant etudiant;

  const EditEtudiantScreen({Key? key, required this.etudiant})
      : super(key: key);

  @override
  _EditEtudiantScreenState createState() => _EditEtudiantScreenState();
}

class _EditEtudiantScreenState extends State<EditEtudiantScreen> {
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;
  late TextEditingController _numTelController;
  late TextEditingController _adresseController;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.etudiant.nom);
    _prenomController = TextEditingController(text: widget.etudiant.prenom);
    _emailController = TextEditingController(text: widget.etudiant.email);
    _ageController =
        TextEditingController(text: widget.etudiant.age.toString());
    _numTelController = TextEditingController(text: widget.etudiant.numTel);
    _adresseController = TextEditingController(text: widget.etudiant.adresse);
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _numTelController.dispose();
    _adresseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Etudiant'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nom',
                style: TextStyle(color: kTextColor),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                'Prenom',
                style: TextStyle(color: kTextColor),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _prenomController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                'Email',
                style: TextStyle(color: kTextColor),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                'Age',
                style: TextStyle(color: kTextColor),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                'Numéro de Téléphone',
                style: TextStyle(color: kTextColor),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _numTelController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                'Adresse',
                style: TextStyle(color: kTextColor),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _adresseController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              ElevatedButton(
                onPressed: () {
                  _saveEditedEtudiant(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveEditedEtudiant(BuildContext context) {
    final editedEtudiant = Etudiant(
      id: widget.etudiant.id,
      cin: widget.etudiant.cin,
      nom: _nomController.text,
      prenom: _prenomController.text,
      email: _emailController.text,
      age: int.tryParse(_ageController.text) ?? 0,
      pwd: widget.etudiant.pwd,
      numTel: _numTelController.text,
      adresse: _adresseController.text,
    );

    Navigator.pop(context, editedEtudiant);
  }
}
