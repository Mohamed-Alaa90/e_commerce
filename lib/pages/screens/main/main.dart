import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/pages/screens/category/category_screen.dart';
import 'package:e_commerce/pages/screens/favoret/favoret_screen.dart';
import 'package:e_commerce/pages/screens/home/home.dart';
import 'package:e_commerce/pages/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  static const String route = 'Main';

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route')),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [Home(), FavoretScreen(), CategoryScreen(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            backgroundColor: MyColor.kPrimer,
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColor.kPrimer,
            icon: const Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColor.kPrimer,
            icon: const Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColor.kPrimer,
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
