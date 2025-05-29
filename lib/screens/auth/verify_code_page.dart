import 'package:flutter/material.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  static const String route = 'VerifyCodePage';

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Verify Code')),
      body: Center(child: Text('الرجاء ادخال الكود المرسل إلى $email')),
    );
  }
}
