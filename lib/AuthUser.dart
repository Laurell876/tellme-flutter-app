

import 'dart:core';

class AuthUser {
  int  id;
  String first_name;
  String last_name;
  String email;
  String password;
  String is_admin;

  AuthUser({
    this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.password,
    this.is_admin
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
    id: json["id"],
    first_name: json["first_name"],
    last_name: json["last_name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": first_name,
    "last_name": last_name,
    "email": email,
    "password": password,
  };
}