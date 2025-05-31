import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/cubit/auth_state.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:e_commerce/widget/my_bottom.dart';
import 'package:e_commerce/widget/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  static const String route = 'VerifyCodePage';
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Verify Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black38,
                ),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    //
                    const SizedBox(height: 50),
                    Text('الرجاء ادخال الكود المرسل إلى $email'),
                    const SizedBox(height: 50),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        activeColor: Colors.blue,
                        selectedColor: Colors.blue,
                        inactiveColor: Colors.grey,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller:
                          context
                              .read<AuthCubit>()
                              .authControllers
                              .verifyCodeController,
                      keyboardType: TextInputType.number,
                      onCompleted: (value) {
                        // هنا تقدر تعمل check مباشرة بعد إدخال الكود
                        print("Completed: $value");
                      },
                      onChanged: (value) {
                        // تحديث الحالة لو عايز
                      },
                    ),
                    const SizedBox(height: 50),

                    MyBottom(text: 'Check', onPressed: () {}),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
