import 'package:calvesia/feature/pages/profile_page/profile_page.dart';
import 'package:calvesia/feature/provider/header_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/base_provider.dart';
import 'layouts/header.dart';
import 'view/buy_page_coming_soon.dart';
import 'view/explore_page.dart';
import 'view/favorite_page.dart';
import 'view/home_page.dart';


class BasePageMiddleWawe extends StatelessWidget {
  const BasePageMiddleWawe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HeaderProvider>(
      builder: (context, provider, child) {
        return BasePage(provider: provider,);
      },
    );
  }
}


class BasePage extends StatefulWidget {
  final HeaderProvider provider;
  const BasePage({Key? key, required this.provider}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  final searchController = TextEditingController();

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
    searchController.text = "";
    widget.provider.clearHeaderText();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              HeaderComponent(searchController: searchController),
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
