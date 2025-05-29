import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_locator.dart';
import 'cubit/main_navi_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String route = 'MainScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainNavigatorCubit>(),
      child: BlocBuilder<MainNavigatorCubit, int>(
        builder: (context, state) {
          final cubit = context.read<MainNavigatorCubit>();

          return Scaffold(
            body: cubit.currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: state,
              onTap: (index) => cubit.changeTap(index),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(backgroundColor: Colors.black,
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state == 0 ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.home,
                      color: state == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(backgroundColor: Colors.black,
                  icon: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state == 1 ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: state == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(backgroundColor: Colors.black,
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state == 2 ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.category,
                      color: state == 2 ? Colors.white : Colors.grey,
                    ),
                  ),
                  label: 'Category',
                ),
                BottomNavigationBarItem(backgroundColor: Colors.black,
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state == 3 ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.person,
                      color: state == 3 ? Colors.white : Colors.grey,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            )
            ,
          );
        },
      ),
    );
  }
}
