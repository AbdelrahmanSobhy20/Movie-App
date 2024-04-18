import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app_indvidual/features/profile/presentation/screens/profile_screen.dart';
import 'package:movie_app_indvidual/core/general_screens/search_screen.dart';
import 'package:movie_app_indvidual/features/bookmark/presentation/screens/bookmark_screen.dart';
import 'package:movie_app_indvidual/features/home/presentation/screens/home_screen.dart';

class NAVBarScreen extends StatefulWidget {
  const NAVBarScreen({super.key});

  @override
  State<NAVBarScreen> createState() => _NAVBarScreenState();
}

class _NAVBarScreenState extends State<NAVBarScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ]),
        child: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              backgroundColor: Theme.of(context).colorScheme.surface,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.black54,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).colorScheme.onSurface,
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.bookmark_border_rounded,
                  text: 'Bookmark',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  iconSize: 30,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
