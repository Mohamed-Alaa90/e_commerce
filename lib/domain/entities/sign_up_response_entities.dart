import 'user_entities.dart';

/// message : "success"
/// user : {"name":"mohamed","email":"mohamedalaa200@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MTgwZWNiNTc3YjI4ZjQ4MWM0YzRhYyIsIm5hbWUiOiJtb2hhbWVkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDY0MDcxMTYsImV4cCI6MTc1NDE4MzExNn0.FqLjqdo7D_Q1pLSxswmJxa5t8s_6bfe323vjYK8wCyc"

class SignUpResponseEntities {
  SignUpResponseEntities({this.message, this.user, this.token});

  String? message;
  UserEntities? user;
  String? token;
}
