import 'package:e_commerce/features/on_boarding/widget/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'OnBoarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //
        child: OnBoardingViewBody(),
      ),
    );
  }
}
