import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:social_media_app/pages/home_page.dart';
import 'package:social_media_app/pages/profile_page.dart';

class MyBottonNavBar extends StatefulWidget {
  const MyBottonNavBar({super.key});

  @override
  State<MyBottonNavBar> createState() => _MyBottonNavBarState();
}

int _currentScreenIndex = 0;
List<Widget> _screens = [HomePage(), Scaffold(), Scaffold(), ProfilePage()];

class _MyBottonNavBarState extends State<MyBottonNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('immi')),
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'H O M E',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.search),
            label: 'S E A R C H',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.settings),
            label: 'S E T T I N G',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'P R O F I L E',
          ),
        ],
      ),
    );
  }
}
