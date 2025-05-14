import 'package:e_commerce/screens/home/widget/home_categories_section.dart';
import 'package:e_commerce/screens/home/widget/home_search_bar.dart';
import 'package:e_commerce/screens/home/widget/home_slide_ads.dart';
import 'package:e_commerce/screens/home/widget/home_welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeWelcomeHeader(),
                SizedBox(height: 16.h),
                const HomeSearchBar(),
                SizedBox(height: 24.h),
                const HomeSlideAds(),
                SizedBox(height: 24.h),
                const HomeCategoriesSection(),
                SizedBox(height: 16.h),
                HomeApplianceSection()

              ],
            ),
          ),
        ),
      ),
    );
  }
}





class HomeApplianceSection extends StatelessWidget {
   HomeApplianceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Home Appliance', style: theme.textTheme.headlineSmall),
              TextButton(
                onPressed: () {},
                child: Text('View All', style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: homeAppliances.length,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                final product = homeAppliances[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 90.w,
                          height: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: AssetImage(product.image,),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(product.name, style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<FakeProduct> homeAppliances = [
    FakeProduct(name: 'Washing Machine', image: 'assets/image/Frame 9.png'),
    FakeProduct(name: 'Microwave', image: 'assets/image/Ellipse 15 (1).png'),
    FakeProduct(name: 'Vacuum Cleaner', image: 'assets/image/Frame 11.png'),
    FakeProduct(name: 'Fridge', image: 'assets/image/Frame 10.png'),
  ];

}
class FakeProduct {
  final String name;
  final String image;

  FakeProduct({required this.name, required this.image});
}


