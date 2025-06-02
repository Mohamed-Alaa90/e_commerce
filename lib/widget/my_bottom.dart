import 'package:animated_button/animated_button.dart';
import 'package:e_commerce/core/theme/my_colors.dart';
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  const MyBottom({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.color,
    this.height,
    this.width,
  });

  final String text;
  final void Function() onPressed;
  final double? borderRadius;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: height ?? 50,
      width: width ?? 150,
      onPressed: onPressed,
      borderRadius: borderRadius ?? 15,
      color: color ?? MyColors.kprimerColors,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
