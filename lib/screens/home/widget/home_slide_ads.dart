import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlideAds extends StatelessWidget {
  const HomeSlideAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 200.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ImageSlideshow(
        isLoop: true,
        autoPlayInterval: 3000,
        indicatorRadius: 4,
        indicatorBackgroundColor: Colors.grey,
        indicatorColor: Theme.of(context).primaryColor,
    
        children: [
          Image.asset('assets/image/Property1.png'),
          Image.asset('assets/image/Property2.png'),
          Image.asset('assets/image/Property3.png'),
        ],
      ),
    );
  }
}