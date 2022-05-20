import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:calvesia/feature/onboard/OnBoardPage.dart';
import 'package:calvesia/feature/pages/view/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/base_provider.dart';
import 'layouts/Header.dart';
import 'view/BuyPageComingSoon.dart';
import 'view/ExplorePage.dart';
import 'view/FavoritePage.dart';
import 'view/HomePage.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    FavoritePage(),
    BuyPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              HeaderComponent(),
              Expanded(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ],
          ),
          bottomNavigationBar: Consumer<BaseProvider>(
            builder: (context, value, child) {
              final bool result = value.isShowNavigationButton;
              return result
                  ? BottomNavigationBarWidget(
                      onItemTapped: _onItemTapped,
                      selectedIndex: _selectedIndex)
                  : const ProfilePageAppBarr();
            },
          )),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  final Function(int index) onItemTapped;
  final int selectedIndex;
  BottomNavigationBarWidget(
      {Key? key, required this.onItemTapped, required this.selectedIndex})
      : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: ""),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}
