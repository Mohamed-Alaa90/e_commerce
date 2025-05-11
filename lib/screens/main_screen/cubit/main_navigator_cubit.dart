import 'package:e_commerce/screens/categores/category_screen.dart';
import 'package:e_commerce/screens/favorites/favorites_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigatorCubit extends Cubit<int> {
  MainNavigatorCubit() : super(0);

  final List<Widget> taps = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void changeTap(int index) {
    emit(index);
  }

  Widget get currentScreen => taps[state];
}
