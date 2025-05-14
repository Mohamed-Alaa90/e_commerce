import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_category_card.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryItem('Women\'s fashion', 'assets/image/Ellipse 14.png'),
      CategoryItem('Men\'s fashion', 'assets/image/Ellipse 15.png'),
      CategoryItem('Electronics', 'assets/image/Ellipse 16.png'),
      CategoryItem('Beauty', 'assets/image/Ellipse 16 (1).png'),
      CategoryItem('Headphones', 'assets/image/Ellipse 15 (1).png'),
      CategoryItem('Skincare', 'assets/image/Ellipse 14 (1).png'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop by Category',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey[800],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return HomeCategoryCard(categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final String imagePath;

  CategoryItem(this.title, this.imagePath);
}
