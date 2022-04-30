import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Explore',
    ),
    Text(
      'Index 2: Favorite',
    ),
    Text(
      'Index 3: Coming Soon',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
    ),
      bottomNavigationBar: BottomNavigationBarWidget(onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  final Function(int index) onItemTapped;
  final int selectedIndex;
  BottomNavigationBarWidget({Key? key, required this.onItemTapped, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
            label: ""

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
            label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
            label: ""
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );  }
}
