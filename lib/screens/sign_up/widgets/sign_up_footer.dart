

import 'package:e_commerce/screens/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SizedBox(width: 6.w),
        Text(
          'You have account?',
          style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
        ),
        SizedBox(width: 4.w),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(_createRoute());
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 15, color: theme.primaryColor),
          ),
        ),
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}