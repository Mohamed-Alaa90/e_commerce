import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository.dart';

import '../entities/AuthResultEntity.dart';
import '../entities/failurs.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, Authresultentity>> invoke(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  ) {
    return authRepository.register(
      name,
      phone,
      email,
      password,
      confirmPassword,
    );
  }
}
