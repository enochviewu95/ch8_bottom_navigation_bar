import 'package:flutter/material.dart';
import 'package:ch8_bottom_navigation_bar/pages/birthdays.dart';
import 'package:ch8_bottom_navigation_bar/pages/gratitude.dart';
import 'package:ch8_bottom_navigation_bar/pages/reminders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;


  @override
  void initState() {
    super.initState();
    _listPages
        ..add(Birthdays())
        ..add(Gratitude())
        ..add(Reminders());
    _currentPage = Birthdays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Birthdays',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Gratitude',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminders',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }

  void _changePage(int selectedIndex){
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }
}
