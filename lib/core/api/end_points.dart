class EndPoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';
  static const String signIn = 'auth/signin';
  static const String signUp = 'auth/signup';
  static const String forgotPasswords = 'auth/forgotPasswords';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String changeMyPassword = 'users/changeMyPassword';
  static const String resetPassword = 'auth/resetPassword';
  static const String allUsers = 'users';
  static const String verifyToken = 'auth/verifyToken';
  static const String updateMe = 'users/updateMe/';
}

class ApiKeys {
  static String name = 'name';
  static String email = 'email';
  static String password = 'password';
  static String rePassword = 'rePassword';
  static String phone = 'phone';
  static String resetCode = 'resetCode';
  static String newPassword = 'newPassword';
}

class CacheKeys {
  static const token = 'token';
}
 