import 'package:pro_mina/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.user,
    required super.token,
  });

  factory LoginModel.fromJson(dynamic json) {
    return LoginModel(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User extends UserEntity {
  User({
    required this.id,
    required super.name,
    required super.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  int id;

  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
}
