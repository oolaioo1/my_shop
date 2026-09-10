import 'package:flutter/material.dart';

import 'package:my_shop/pages/Home/index.dart';
import 'package:my_shop/pages/Category/index.dart';
import 'package:my_shop/pages/Cart/index.dart';
import 'package:my_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/images/home_inactive.png",
      "active_icon": "lib/assets/images/home_active.png",
      "title": "首页",
    },
    {
      "icon": "lib/assets/images/category_inactive.png",
      "active_icon": "lib/assets/images/category_active.png",
      "title": "分类",
    },
    {
      "icon": "lib/assets/images/cart_inactive.png",
      "active_icon": "lib/assets/images/cart_active.png",
      "title": "购物车",
    },
    {
      "icon": "lib/assets/images/profile_inactive.png",
      "active_icon": "lib/assets/images/profile_active.png",
      "title": "我的",
    },
  ];

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["title"],
      );
    });
  }

  List<Widget> _getChidlren() {
    return [HomeView(), CategryView(), CartView(), MienView()];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChidlren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _getTabBarWidget(),
      ),
    );
  }
}
