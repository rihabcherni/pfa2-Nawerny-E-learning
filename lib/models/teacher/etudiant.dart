class Etudiant {
  final int id;
  final String cin;
  final String nom;
  final String prenom;
  final String email;
  final int age;
  final String pwd;
  final String numTel;
  final String adresse;

  Etudiant({
    required this.id,
    required this.cin,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.age,
    required this.pwd,
    required this.numTel,
    required this.adresse,
  });
}
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
  ];