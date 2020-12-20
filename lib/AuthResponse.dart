import 'package:tellme_flutter_app/AuthUser.dart';

class AuthResponse {
  AuthUser user;
  String accessToken;
  String refreshToken;

  AuthResponse({
    this.user,
    this.accessToken,
    this.refreshToken
  });


  factory AuthResponse.fromJson(Map<dynamic, dynamic> json) => AuthResponse(
    user: AuthUser.fromJson(json["user"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}