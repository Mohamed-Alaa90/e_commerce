import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  const MyBottom({super.key, required this.text, required this.onPressed});

  final String text;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: 50,
      width: 150,

      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
