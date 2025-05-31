import 'package:e_commerce/core/api/api_consumer.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/utils/shared_prefs_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void register() async {
    try {
      emit(LoadingAuthState());
      final response = await apiConsumer.post(
        EndPoints.signUp,
        data: {
          ApiKeys.name: authControllers.registerNameController.text,
          ApiKeys.email: authControllers.registerEmailController.text,
          ApiKeys.password: authControllers.registerPasswordController.text,
          ApiKeys.rePassword: authControllers.registerRePasswordController.text,
          ApiKeys.phone: authControllers.registerPhoneController.text,
        },
      );
      emit(SuccessAuthState(response));
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(ErrorAuthState(errorMessage: errorMessage));
    }
  }

  void login() async {
    try {
      emit(LoadingAuthState());
      final response = await apiConsumer.post(
        EndPoints.signIn,
        data: {
          ApiKeys.email: authControllers.loginEmailController.text,
          ApiKeys.password: authControllers.loginPasswordController.text,
        },
      );
      var user = AuthModel.fromJson(response);
      await SharedPrefsHelper.insertToCache(
        key: CacheKeys.token,
        value: user.token,
      );
      emit(SuccessAuthState(user));
    } on ServerException catch (e) {
      final errorMessage =
          e.errorModel.errors?.msg ??
          e.errorModel.message ??
          'حدث خطأ غير متوقع';
      emit(ErrorAuthState(errorMessage: errorMessage));
    }
  }

  void forgotPassword() async {
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

  void verifyResetCode() async {
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

  void resetPassword(String email) async {
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
}
