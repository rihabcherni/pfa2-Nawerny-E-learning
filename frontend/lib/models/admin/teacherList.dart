class Teacher {
  final int id;
  final bool isVerified;
  final String email;
  final String? phoneNumber;
  final String firstName;
  final String lastName;
  final String? photo;
  final String? address;
  final String? dateOfBirth;

  Teacher({
    required this.id,
    required this.isVerified,
    required this.email,
    this.phoneNumber,
    required this.firstName,
    required this.lastName,
    this.photo,
    this.address,
    this.dateOfBirth,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      isVerified: json['is_verified'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      photo: json['photo'] ?? 'assets/images/account.png',
      address: json['address'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
    );
  }
}
