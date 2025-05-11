import 'UserEntity.dart';

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.userEntity,
      this.token,});


  String? message;
  UserEntity? userEntity;
  String? token;


}