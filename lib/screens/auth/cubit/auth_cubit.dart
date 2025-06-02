import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_consumer.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/utils/shared_prefs_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../core/utils/auth_controllers.dart';
import '../../../models/AuthModel.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.apiConsumer) : super(InitAuthState());
  final ApiConsumer apiConsumer;
  final AuthControllers authControllers = AuthControllers();

  void clearControllers() {
    authControllers.clear();
  }

  Future<void> register() async {
    try {
      emit(LoadingRegisterState());
      await apiConsumer.post(
        EndPoints.signUp,
        data: {
          ApiKeys.name: authControllers.registerNameController.text,
          ApiKeys.email: authControllers.registerEmailController.text,
          ApiKeys.password: authControllers.registerPasswordController.text,
          ApiKeys.rePassword: authControllers.registerRePasswordController.text,
          ApiKeys.phone: authControllers.registerPhoneController.text,
        },
      );
      emit(SuccessRegisterState());
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(ErrorRegisterState(errorMessage: errorMessage));
    }
  }

  Future<void> login() async {
    try {
      emit(LoadingLoginState());
      final response = await apiConsumer.post(
        EndPoints.signIn,
        data: {
          ApiKeys.email: authControllers.loginEmailController.text,
          ApiKeys.password: authControllers.loginPasswordController.text,
        },
      );
      var user = AuthModel.fromJson(response);

      final decodedToken = JwtDecoder.decode(user.token);
      await SharedPrefsHelper.insertToCache(
        key: CacheKeys.token,
        value: user.token,
      );
      await SharedPrefsHelper.insertToCache(
        key: 'id',
        value: decodedToken['id'],
      );
      if (JwtDecoder.isExpired(user.token)) {
        emit(ErrorLoginState(errorMessage: 'انتهت صلاحية التوكن'));
        return;
      }

      emit(SuccessLoginState(user));
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(ErrorLoginState(errorMessage: errorMessage));
    }
  }

  Future<void> forgotPassword() async {
    try {
      emit(AuthCodeSentLoading());
      await apiConsumer.post(
        EndPoints.forgotPasswords,
        data: {ApiKeys.email: authControllers.forgotPasswordController.text},
      );

      emit(AuthCodeSentSuccess());
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(AuthCodeSentError(errorMessage: errorMessage));
    }
  }

  Future<void> verifyResetCode() async {
    try {
      emit(VerifyResetCodeLoading());
      await apiConsumer.post(
        EndPoints.verifyResetCode,
        data: {ApiKeys.resetCode: authControllers.verifyCodeController.text},
      );
      emit(VerifyResetCodeSuccess());
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(AuthCodeSentError(errorMessage: errorMessage));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(ResetPasswordLoading());

      await apiConsumer.post(
        EndPoints.resetPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.newPassword: authControllers.newPasswordController.text,
        },
      );

      emit(ResetPasswordSuccess());
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(AuthCodeSentError(errorMessage: errorMessage));
    }
  }

  Future<void> verifyToken() async {
    try {
      emit(VerifyTokenLoading());

      final token = SharedPrefsHelper.getCacheData(key: CacheKeys.token);
      if (token == null || token.isEmpty) {
        emit(VerifyTokenError(errorMessage: 'التوكن غير موجود'));
        return;
      }
      SharedPrefsHelper.getCacheData(key: CacheKeys.token);

      await apiConsumer.get(
        EndPoints.verifyToken,
        options: Options(
          headers: {
            'token': SharedPrefsHelper.getCacheData(key: CacheKeys.token),
          },
        ),
      );
      emit(VerifyTokenSuccess());
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(VerifyTokenError(errorMessage: errorMessage));
    }
  }
}
