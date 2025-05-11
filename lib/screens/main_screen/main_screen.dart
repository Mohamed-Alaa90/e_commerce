import 'package:e_commerce/screens/main_screen/cubit/main_navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String routeName = 'MainScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   // final colorScheme = theme.colorScheme;

    return BlocProvider(
      create: (context) => MainNavigatorCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocSelector<MainNavigatorCubit, int, Widget>(
              selector: (state) => context.read<MainNavigatorCubit>().currentScreen,
              builder: (context, currentScreen) => SafeArea(child: currentScreen),
            ),
            bottomNavigationBar: BlocSelector<MainNavigatorCubit, int, int>(
              selector: (state) => state,
              builder: (context, currentIndex) {
                final cubit = context.read<MainNavigatorCubit>();
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    iconSize: 24.sp,
                    selectedItemColor: theme.primaryColor,
                    unselectedItemColor: Colors.grey,
                    currentIndex: currentIndex,
                    onTap: cubit.changeTap,
                    selectedLabelStyle: TextStyle(fontSize: 12.sp),
                    unselectedLabelStyle: TextStyle(fontSize: 12.sp),
                    items: [
                      _buildNavItem(
                        icon: Icons.home_outlined,
                        activeIcon: Icons.home,
                        label: 'Home',
                        theme: theme,
                        isActive: currentIndex == 0,
                      ),
                      _buildNavItem(
                        icon: Icons.category,
                        activeIcon: Icons.category_outlined,
                        label: 'Favorites',
                        theme: theme,
                        isActive: currentIndex == 1,
                      ),
                      _buildNavItem(
                        icon: Icons.favorite_border,
                        activeIcon: Icons.favorite,
                        label: 'Alerts',
                        theme: theme,
                        isActive: currentIndex == 2,
                      ),
                      _buildNavItem(
                        icon: Icons.person_outline,
                        activeIcon: Icons.person,
                        label: 'Profile',
                        theme: theme,
                        isActive: currentIndex == 3,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required ThemeData theme,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: isActive ? theme.primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(isActive ? activeIcon : icon),
      ),
      activeIcon: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(activeIcon),
      ),
      label: label,
    );
  }
}