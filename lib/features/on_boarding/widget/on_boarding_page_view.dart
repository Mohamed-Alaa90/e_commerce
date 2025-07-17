import 'package:e_commerce/core/constant/constant.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/on_boarding/widget/page_view_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView(
      {super.key, required this.controller, this.onPageChanged});

  final PageController controller;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        onPageChanged:onPageChanged,
        controller: controller,
        children: [
          PageViewItem( isVisibility: false,
            image: AppAssets.onBoardingImage2,
            backGroundImage: AppAssets.onBoardingBackGroundImage1,
            tittle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "مرحبا بك في ",
                  style: MyTheme.lightTheme.textTheme.titleSmall,
                ),

                Text(
                  "HUB",
                  style: MyTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    color: AppColors.goldColor,
                  ),
                ),
                Text(
                  'Fruit',
                  style: MyTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    color: MyTheme.lightTheme.primaryColor,
                  ),
                ),
              ],
            ),
            subTitle:
            'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          ),
          PageViewItem(
            isVisibility: true,
            image: AppAssets.onBoardingImage1,
            backGroundImage: AppAssets.onBoardingBackGroundImage2,
            tittle: Text(
              'ابحث وتسوق',
              style: MyTheme.lightTheme.textTheme.titleSmall,
            ),
            subTitle:
            'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          ),
        ],
      ),
    );
  }
}
