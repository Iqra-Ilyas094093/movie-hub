import 'package:flutter/material.dart';
import 'package:movie_hub/view/screens/home_screen.dart';
import 'package:movie_hub/view/screens/profile_screen.dart';
import 'package:movie_hub/view/screens/search_screen.dart';
import 'package:movie_hub/view/screens/watch_list_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    WatchlistScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          border: const Border(
            top: BorderSide(
              color: Colors.white10,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                _buildNavItem(Icons.home, 'Home',  0),
                _buildNavItem(Icons.search, 'Search',  1),
                _buildNavItem(Icons.bookmark, 'Watchlist',2),
                _buildNavItem(Icons.person, 'Profile',3),
              ],
            ),
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
  Widget _buildNavItem(IconData icon, String label,int index, [bool isActive = false]) {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            selectedIndex = index;
            isActive = true;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              color: selectedIndex == index ? Color(0xFF5b13ec) : Colors.white60,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selectedIndex == index ? Color(0xFF5b13ec) : Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
