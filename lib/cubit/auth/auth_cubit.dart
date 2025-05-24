import 'package:e_commerce/cubit/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());

  GlobalKey<FormState> registerFormKey = GlobalKey();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerRePasswordController = TextEditingController();

  register() {
    if (registerFormKey.currentState!.validate()) {}
  }
}
