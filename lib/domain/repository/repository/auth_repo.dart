import 'package:e_commerce/domain/entities/sign_up_response_entities.dart';

abstract class AuthRepo {
  Future<SignUpResponseEntities> signUp(
    String name,
    String email,
    String password,
    String phone,
    String rePassword,
  );
}
