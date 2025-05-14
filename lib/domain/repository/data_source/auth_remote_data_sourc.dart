import 'package:dartz/dartz.dart';

import '../../entities/AuthResultEntity.dart';
import '../../entities/failurs.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, Authresultentity>> register(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  );
}
