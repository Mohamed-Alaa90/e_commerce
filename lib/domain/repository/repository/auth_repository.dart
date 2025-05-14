import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce/domain/entities/failurs.dart';

abstract class AuthRepository {
  Future<Either<Failures, Authresultentity>> register(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  );
}
