import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore.dart';
import 'package:fitme/screens/SearchScreen/search.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:fitme/constants/colors.dart';
import 'package:fitme/screens/ExploreScreen/explore.dart';

import 'bottom_drawer_menu.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final String name = "Tùng";

  //title la cai hien len appbar
  final List<Map<String, dynamic>> _screens = [
    {
      'screen': ExploreScreen(),
      'name': 'explore',
      'title': 'Chào ',
    },
    {
      'screen': PraticeExploreScreen(),
      'name': 'feedPratice',
      'title': 'Tập luyện',
    },
    {
      'screen': BottomDrawer(),
      'name': 'log',
      'title': 'Log',
    },
    {
      'screen': MealExploreScreen(),
      'name': 'feedMeal',
      'title': 'Meal',
    },
    {
      'screen': UserProfileScreen(),
      'name': 'user',
      'title': 'User',
    },
  ];

  void _onScreenItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return BottomDrawer();
          });
    }
  }

  PreferredSizeWidget getUserProfileAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Lalisa Manoban",
        style: TextStyle(fontSize: 16),
      ),
      leading: Row(
        children: [
          SizedBox(width: 15),
          Icon(CommunityMaterialIcons.professional_hexagon),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.setting);
          },
          child: Icon(CommunityMaterialIcons.cog),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }

  PreferredSizeWidget getPracticeAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  PreferredSizeWidget getDetailAppBar() {
    return AppBar(
      leading: Icon(Icons.chevron_left),
      centerTitle: false,
      titleSpacing: 0,
      title: Text(
        "Quay lại",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  PreferredSizeWidget getFeedPraticeAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(CommunityMaterialIcons.bookmark_outline),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.favorite);
        },
      ),
      centerTitle: true,
      titleSpacing: 0,
      title: Text(
        "Tập luyện",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      // Action để search
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: Search(true, false),
            );
          },
        ),
      ],
      shadowColor: Colors.transparent, // làm mờ cái line dưới app bar
    );
  }

  PreferredSizeWidget getFeedMealAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(CommunityMaterialIcons.bookmark_outline),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.favorite);
        },
      ),
      centerTitle: true,
      titleSpacing: 0,
      title: Text(
        "Bữa ăn",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      // Action để search
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: Search(false, true),
            );
          },
        ),
      ],
      shadowColor: Colors.transparent, // làm mờ cái line dưới app bar
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar;
    switch (_screens[_selectedIndex]['name']) {
      case ('user'):
        appBar = getUserProfileAppBar();
        break;
      case ('feedPratice'):
        appBar = getFeedPraticeAppBar();
        break;
      case ('feedMeal'):
        appBar = getFeedMealAppBar();
        break;
    }
    Color backgroundColor = Colors.white;
    return Scaffold(
      appBar: appBar,
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
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
        onTap: _onScreenItemTapped,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
    );
  }
}
