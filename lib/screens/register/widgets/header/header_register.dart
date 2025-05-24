import 'package:flutter/material.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        SizedBox(height: 130),
        Text(
          'Register',
          style: TextStyle(
            //
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}