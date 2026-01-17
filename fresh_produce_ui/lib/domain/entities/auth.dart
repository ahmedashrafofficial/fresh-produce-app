class AuthUser {
  final String id;
  final String email;
  final String token;
  final String refreshToken;

  AuthUser({
    required this.id,
    required this.email,
    required this.token,
    required this.refreshToken,
  });
}
