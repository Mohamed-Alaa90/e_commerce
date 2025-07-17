import 'package:e_commerce/core/constant/constant.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/widget/custom_bottom.dart';
import 'package:e_commerce/features/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildLoginForm(),
            SizedBox(height: 16.h),
            _buildButtons(),
            SizedBox(height: 30.h),

            _buildOrDivider(),
            SizedBox(height: 16.h),

            _buildSocialLoginButton(
              onTap: () {},
              iconPath: AppAssets.googleIcon,
              title: 'تسجيل بواسطة جوجل',
            ),
            _buildSocialLoginButton(
              onTap: () {},
              iconPath: AppAssets.facebookIcon,
              title: 'تسجيل بواسطة فيسبوك',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            obscureText: false,
            controller: _emailController,
            validator: _validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            hintText: 'كلمة المرور',
            obscureText: _obscureText,
            controller: _passwordController,
            validator: _validatePassword,
            suffixIcon: IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    final theme = MyTheme.lightTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'نسيت كلمه المرور ؟',
            style: theme.textTheme.labelSmall!.copyWith(
              color: AppColors.greenColor,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Align(
          alignment: Alignment.center,
          child: CustomBottom(text: 'تسجيل الدخول', onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Handle login logic here
              print('Email: ${_emailController.text}');
              print('Password: ${_passwordController.text}');
            }
          }),
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ليس لديك حساب ؟',
              style: theme.textTheme.labelSmall!.copyWith(
                color: const Color(0xff949D9E),
              ),
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RegisterView.routeName);
              },
              child: Text(
                'قم بإنشاء حساب',
                style: theme.textTheme.labelSmall!.copyWith(
                  color: AppColors.lightColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 0.5.h,
            color: const Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            'او',
            style: MyTheme.lightTheme.textTheme.labelMedium!.copyWith(
              color: const Color(0xff0C0D0D),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            height: 0.5.h,
            color: const Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton({
    required String title,
    required String iconPath,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, width: 27.w, height: 27.h),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: MyTheme.lightTheme.textTheme.labelMedium!.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'يرجى إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }
}
