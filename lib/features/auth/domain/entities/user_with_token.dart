import 'package:ashafaq/features/auth/data/models/m_user.dart';

final class UserWithToken {
  final UserModel user;
  final String token;
  const UserWithToken(this.user, this.token);
}
