import 'package:e_commerce/core/constant/constant.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/on_boarding/widget/page_view_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          PageViewItem(
            image: AppAssets.onBoardingImage2,
            backGroundImage: AppAssets.onBoardingBackGroundImage1,
            tittle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome_to".tr(),
                  style: MyTheme.lightTheme.textTheme.titleSmall,
                ),

                Text(
                  "HUB",
                  style: MyTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    color: MyTheme.goldColor,
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
