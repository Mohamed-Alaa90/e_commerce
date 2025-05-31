import 'package:flutter/material.dart';

class AuthControllers {
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPhoneController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerRePasswordController =
      TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController forgotPasswordController =
      TextEditingController();

  final TextEditingController verifyCodeController = TextEditingController();
  final GlobalKey<FormState> verifyCodeFormKey = GlobalKey();

  final TextEditingController newPasswordController = TextEditingController();

  void clear() {
    registerEmailController.clear();
    registerPhoneController.clear();
    registerPasswordController.clear();
    registerNameController.clear();
    registerRePasswordController.clear();
    loginPasswordController.clear();
    loginEmailController.clear();
    verifyCodeController.clear();
    newPasswordController.clear();
  }
}
