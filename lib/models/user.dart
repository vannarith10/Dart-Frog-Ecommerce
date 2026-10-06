class User {
  const User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.passwordHash,
    required this.createdAt,
  });

  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String passwordHash;
  final DateTime createdAt;
}
