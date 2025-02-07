

import 'package:flutter/material.dart';
import 'package:smart_lifters/src/content/account/account.dart';
import 'package:smart_lifters/src/content/favorites/favorites.dart';
import 'package:smart_lifters/src/content/home/home.dart';
import 'package:smart_lifters/src/content/workout/workout.dart';

class ContentController extends StatefulWidget {
  const ContentController({super.key});

  static final PageController pageController = PageController(initialPage: 0);

  @override
  State<ContentController> createState() => ContentControllerState();
}

class ContentControllerState extends State<ContentController> {
  int _selectedIndex = 0;
  final List<Widget> _navbarPages = [
    const ScreenHome(),
    const ScreenWorkout(),
    const ScreenFavorites(),
    ScreenAccount(),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: ContentController.pageController,
          children: _navbarPages,
          onPageChanged: (i) => setState(() => _selectedIndex = i),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (i) => {
             ContentController.pageController.animateToPage(i, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut)
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout',),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites',),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',)
          ],
        ),
      ),
    );
  }
}