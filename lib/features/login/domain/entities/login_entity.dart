class LoginEntity {
  LoginEntity({
    required this.user,
    required this.token,
  });

  UserEntity user;
  String token;
}

class UserEntity {
  UserEntity({
    required this.name,
    required this.email,
  });

  String name;
  String email;
}
