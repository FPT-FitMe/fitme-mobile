import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:fitme/constants/colors.dart';
import 'package:fitme/screens/ExploreScreen/explore.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final String name = "Hùng";
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
    index == 2
        ? _drawerKey.currentState!.openDrawer()
        : setState(() {
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
      key: _drawerKey,
      //CL tu add BottomDrawer ở đây nha, thay cho Drawer á
      drawer: Drawer(),
      appBar: appBar,
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color_background,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            activeIcon: Icon(Icons.access_time_filled),
            label: 'Tiến độ',
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.arm_flex_outline),
            activeIcon: Icon(CommunityMaterialIcons.arm_flex),
            label: 'Tập luyện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Tạo mới',
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.pot_steam_outline),
            activeIcon: Icon(CommunityMaterialIcons.pot_steam),
            label: 'Bữa ăn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: 'Người dùng',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: AppColors.textColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 0,
      ),
      backgroundColor: color_background,
    );
  }
}
