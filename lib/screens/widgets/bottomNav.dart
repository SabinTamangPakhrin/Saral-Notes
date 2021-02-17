import 'package:flutter/material.dart';
import 'package:saral_notes/screens/growing.dart';
import 'package:saral_notes/screens/home.dart';
import 'package:saral_notes/screens/profile.dart';
import 'package:saral_notes/screens/notes.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [HomeScreen(), NotesScreen(), GrowingScreen(), ProfileScreen()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
        ),
        selectedIconTheme: IconThemeData(
          color: Color(0xffDC143C),
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.green,
        ),
        showSelectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup),
            label: 'Growing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
