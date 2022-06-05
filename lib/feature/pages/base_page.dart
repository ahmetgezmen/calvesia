import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/pages/post_page/post_page_button.dart';
import 'package:calvesia/feature/pages/post_page/post_show_page.dart';
import 'package:calvesia/feature/pages/profile_page/profile_page.dart';
import 'package:calvesia/feature/provider/header_provider.dart';
import 'package:calvesia/feature/provider/post_provider.dart';
import 'package:calvesia/feature/widget/something_wrong.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Authencitation/viewmodel/user_view_model.dart';
import '../provider/base_provider.dart';
import 'layouts/header.dart';
import 'view/calender_page.dart';
import 'view/explore_page.dart';
import 'view/favorite_page.dart';
import 'view/home_page.dart';

class BasePageMiddleWave extends StatelessWidget {
  const BasePageMiddleWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HeaderProvider>(
      builder: (context, provider, child) {
        return BasePage(
          provider: provider,
        );
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
  final GlobalKey _parentKey = GlobalKey();
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
  void initState() {
    super.initState();
    Provider.of<UserVievModel>(context, listen: false).userFetch();
    Provider.of<BaseProvider>(context, listen: false)
        .setShowNavigationButtonFunkBase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<PostIsSharingAndShowingProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              HeaderComponent(searchController: searchController),
              Expanded(
                key: _parentKey,
                child: Stack(
                  children: [
                    _widgetOptions.elementAt(_selectedIndex),
                    if (FirebaseAuth.instance.currentUser!.isAnonymous == false)
                      DraggableFloatingActionButton(
                        child: InkWell(
                          onTap: () {
                            openPostPage(context, provider);
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                              color: BaseColorPalet.main,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        initialOffset: const Offset(0, 30),
                        parentKey: _parentKey,
                        onPressed: () {},
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ), bottomNavigationBar: Consumer<BaseProvider>(
        builder: (context, value, child) {
          final String result = value.getShowNavigationButton;
          return result == "base"
              ? BottomNavigationBarWidget(
                  onItemTapped: _onItemTapped, selectedIndex: _selectedIndex)
              : result == "profile"
                  ? const ProfilePageAppBarr()
                  : const PostShowPageAppBarr();
        },
      )),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  final Function(int index) onItemTapped;
  final int selectedIndex;

  const BottomNavigationBarWidget(
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
      selectedItemColor: BaseColorPalet.main,
      unselectedItemColor: BaseColorPalet.inAktiveButtonColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_outlined,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
            ),
            label: ""),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}

class DraggableFloatingActionButton extends StatefulWidget {
  final Widget child;
  final Offset initialOffset;
  final VoidCallback onPressed;
  final GlobalKey parentKey;

  const DraggableFloatingActionButton({
    required this.child,
    required this.initialOffset,
    required this.onPressed,
    required this.parentKey,
  });

  @override
  State<StatefulWidget> createState() => _DraggableFloatingActionButtonState();
}

class _DraggableFloatingActionButtonState
    extends State<DraggableFloatingActionButton> {
  final GlobalKey _key = GlobalKey();

  bool _isDragging = false;
  late Offset _offset;
  late Offset _minOffset;
  late Offset _maxOffset;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;

    WidgetsBinding.instance?.addPostFrameCallback(_setBoundary);
  }

  void _setBoundary(_) {
    final RenderBox parentRenderBox =
        widget.parentKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox renderBox =
        _key.currentContext?.findRenderObject() as RenderBox;

    try {
      final Size parentSize = parentRenderBox.size;
      final Size size = renderBox.size;

      setState(() {
        _minOffset = const Offset(0, 0);
        _maxOffset = Offset(
            parentSize.width - size.width, parentSize.height - size.height);
      });
    } catch (e) {
      somethingWrongWidgetFunction(context);
    }
  }

  void _updatePosition(PointerMoveEvent pointerMoveEvent) {
    double newOffsetX = _offset.dx + pointerMoveEvent.delta.dx;
    double newOffsetY = _offset.dy + pointerMoveEvent.delta.dy;

    if (newOffsetX < _minOffset.dx) {
      newOffsetX = _minOffset.dx;
    } else if (newOffsetX > _maxOffset.dx) {
      newOffsetX = _maxOffset.dx;
    }

    if (newOffsetY < _minOffset.dy) {
      newOffsetY = _minOffset.dy;
    } else if (newOffsetY > _maxOffset.dy) {
      newOffsetY = _maxOffset.dy;
    }

    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Listener(
        onPointerMove: (PointerMoveEvent pointerMoveEvent) {
          _updatePosition(pointerMoveEvent);

          setState(() {
            _isDragging = true;
          });
        },
        onPointerUp: (PointerUpEvent pointerUpEvent) {
          if (_isDragging) {
            setState(() {
              _isDragging = false;
            });
          } else {
            widget.onPressed();
          }
        },
        child: Container(
          key: _key,
          child: widget.child,
        ),
      ),
    );
  }
}
