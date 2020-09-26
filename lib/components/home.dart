import 'package:flutter/material.dart';
import 'package:mvmis/components/profile.dart';
import 'package:mvmis/components/homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final tabs = [
      Profile(),
      Homepage(),
    Center(child: Text('Information'),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 25.0,
                ),
                title: Text('Profile',style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 25.0,
                ),
                title: Text('Schedule',style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.navigation,
                  color: Colors.grey,
                  size: 25.0,
                ),
                title: Text('Nav',style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white),
          ],
          onTap: (index){
            setState(() {
              _currentIndex  = index;
            });
          },
        ));
  }
}
