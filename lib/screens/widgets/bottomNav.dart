import 'package:flutter/material.dart';
import 'package:saral_notes/screens/forum.dart';
import 'package:saral_notes/screens/home.dart';
import 'package:saral_notes/screens/profile.dart';
import 'package:saral_notes/screens/notes.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [HomeScreen(), NotesScreen(), ForumScreen(), ProfileScreen()];

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.note),
      label: 'Notes',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.forum),
      label: 'Forum',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedIconTheme: IconThemeData(color: Color(0xffDC143C)),
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: bottomNavItems,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
