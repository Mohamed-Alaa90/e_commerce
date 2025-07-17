import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce/core/constant/constant.dart';
import 'package:e_commerce/features/on_boarding/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _fadeInController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();

    _fadeInController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _slideController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    executeNavigation();
  }

  @override
  void dispose() {
    _fadeInController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeTransition(
          opacity: _fadeInController,
          child: Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(AppAssets.splashHead),
          ),
        ),

        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.5),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
          ),
          child: SvgPicture.asset(AppAssets.splashCenter),
        ),

        FadeTransition(
          opacity: _fadeInController,
          child: SvgPicture.asset(AppAssets.splashBottom, fit: BoxFit.fill),
        ),
      ],
    );
  }

  Future<void> executeNavigation() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
