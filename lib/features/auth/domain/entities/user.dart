class User {
  final int? id;
  final int userId;
  final String name;
  final String phoneNumber;
  final String email;
  const User({
    this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
