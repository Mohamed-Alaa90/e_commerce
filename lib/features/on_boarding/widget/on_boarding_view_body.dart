import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/widget/custom_bottom.dart';
import 'package:e_commerce/features/auth/login/view/login_view.dart';
import 'package:e_commerce/features/on_boarding/widget/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final int _totalDots = 2;

  final PageController _controller = PageController();

  double _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        OnBoardingPageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _currentPosition = index.toDouble();
            });
          },
        ),
        Directionality(
          textDirection: Directionality.of(context),
          child: DotsIndicator(
            dotsCount: _totalDots,
            position: _currentPosition,
            decorator: DotsDecorator(
              color: AppColors.lightColor,
              activeColor:
                  _currentPosition == _totalDots - 1
                      ? AppColors.lightColor
                      : AppColors.lightColor.withOpacity(0.5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.0.w,
            bottom: 40.0.h,
            right: 16.0.w,
            top: 29.0.h,
          ),
          child: Visibility(
            maintainAnimation: true,
            maintainInteractivity: true,
            maintainSemantics: true,
            maintainSize: true,
            maintainState: true,
            visible: _currentPosition == _totalDots - 1,
            child: CustomBottom(
              text: 'ابدأ الان',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }
}
