import 'package:e_commerce/features/auth/login/view/login_view.dart';
import 'package:e_commerce/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backGroundImage,
    required this.tittle,
    required this.subTitle,
    required this.isVisibility,
  });

  final String image, backGroundImage;
  final Widget tittle;
  final String subTitle;
  final bool isVisibility;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backGroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              isVisibility
                  ? Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginView.routeName,
                          );
                        },
                        child: const Text('تخط'),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(height: 45.h),
        tittle,
        SizedBox(height: 24.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: MyTheme.lightTheme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
