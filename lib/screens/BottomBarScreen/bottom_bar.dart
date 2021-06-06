import 'package:fitme/screens/ExploreScreen/explore.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final String name = "Hùng";

  //title la cai hien len appbar
  final List<Map<String, dynamic>> _screens = [
    {
      'screen': ExploreScreen(),
      'title': 'Chào ',
    },
    {
      'screen': Center(
        child: Text("Practic Screen"),
      ),
      'title': 'Practice',
    },
    {
      'screen': Center(
        child: Text("Log Screen"),
      ),
      'title': 'Log',
    },
    {
      'screen': Center(
        child: Text("Meal Screen"),
      ),
      'title': 'Meal',
    },
    {
      'screen': Center(
        child: Text("User Screen"),
      ),
      'title': 'User',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      title: Text(
        _screens[_selectedIndex]['title'] + name + ",",
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
      backgroundColor: Colors.white,
    );
    Color? color_background = appBar.backgroundColor;
    return Scaffold(
      appBar: appBar,
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color_background,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Tiến độ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tập luyện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Tạo mới',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining),
            label: 'Bữa ăn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Người dùng',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 0,
      ),
      backgroundColor: color_background,
    );
  }
}
