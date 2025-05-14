import 'package:e_commerce/screens/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(onTap: () {}, child: const Text('Forget Password')),
            Icon(Icons.arrow_forward, color: Colors.grey.shade600),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(width: 6.w),
            Text(
              'Dont have an account?',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),
            SizedBox(width: 4.w),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(_createRoute());
              },
              child: Text(
                'Register',
                style: TextStyle(fontSize: 15, color: theme.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegisterScreen(),
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
