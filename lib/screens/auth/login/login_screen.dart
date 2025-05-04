import 'package:e_commerce/screens/auth/widget/my_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              SizedBox(height: 150.h),
              _buildHeader(ThemeData()),
              SizedBox(height: 50.h),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          'Login',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        MyTextForm(
          controller: _emailController,
          labelText: "email",
          hintText: 'enter your email',
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,

          validator: (val) {
            if (val == null || val.isEmpty) {
              return "please enter email";
            }
            if (!val.contains('@')) {
              return 'please enter invaled email';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),

        MyTextForm(
          prefixIcon: Icons.password,
          hintText: 'enter your Password',
          controller: _passwordController,
          labelText: "password",
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscurePassword,
          onSuffixIconPressed: () {
            setState(() => _obscurePassword = !_obscurePassword);
          },
          suffixIcon:
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يجب إدخال كلمة المرور';
            }
            if (value.length < 6) {
              return 'يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل';
            }
            return null;
          },
        ),
      ],
    );
  }
}
