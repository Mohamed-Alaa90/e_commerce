import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category/category_page.dart';
import '../../favorts/favoret_page.dart';
import '../../home/home_page.dart';
import '../../profile/profile_page.dart';

class MainNavigatorCubit extends Cubit<int> {
  MainNavigatorCubit() : super(0);
  bool isSelect = false;

  final List<Widget> screens = [
    HomePage(),
    FavoritePage(),
    CategoryPage(),
    ProfilePage(),
  ];

  void changeTap(int index) {
    emit(index);
  }

  Widget get currentScreen => screens[state];
}
