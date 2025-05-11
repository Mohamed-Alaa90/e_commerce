import 'package:e_commerce/widget/my_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h),
              child: Text('Welcome Mohamed',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold
                  )),
            ),
            SizedBox(height: 16.h),
            const SearchBar(),
            SizedBox(height: 16.h),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: MyTextForm(
              hintText: 'what do you search ?',
              controller: cubit.searchController,
              prefixIcon: Icons.search,

              //onChanged: cubit.updateSearch,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
          color:theme.primaryColor ,
        ),
      ],
    );
  }
}
