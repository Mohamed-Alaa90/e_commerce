import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/widget/my_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

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
