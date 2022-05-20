import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../widget/PopularEventCardWidget.dart';
import '../models/post_model.dart';

class ExplorePage extends StatefulWidget {
  static const List category = [
    {"name": "Parti", "color": BaseColorPalet.partyColor, "tag": 'party'},
    {"name": "Kariyer", "color": BaseColorPalet.careerColor, "tag": 'career'},
    {"name": "Sağlık", "color": BaseColorPalet.healthColor, "tag": 'health'},
    {
      "name": "Eğitim",
      "color": BaseColorPalet.educationColor,
      "tag": 'education'
    }
  ];
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Future<void> _refeshIndicator() {
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: BaseColorPalet.main,
      onRefresh: _refeshIndicator,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CategoryButton(
                      title: ExplorePage.category[index]["name"],
                      buttonColor: ExplorePage.category[index]["color"],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 30,
                  );
                },
              ),
            ),
          ),
          const SilverDelegateComponent(),
        ],
      ),
    );
  }
}

class SilverDelegateComponent extends StatefulWidget {
  const SilverDelegateComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<SilverDelegateComponent> createState() =>
      _SilverDelegateComponentState();
}

class _SilverDelegateComponentState extends State<SilverDelegateComponent> {
  static const _pageSize = 20;
  String _lasPost = '';

  final PagingController<int, DataSnapshot> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var refNewItem = await FirebaseDatabase.instance
          .ref('posts')
          .orderByKey()
          .startAfter(_lasPost)
          .limitToFirst(_pageSize)
          .get();

      final newItems = refNewItem.children.toList();
      _lasPost = newItems.last.key!;

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedGridView<int, DataSnapshot>(
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 100 / 150,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<DataSnapshot>(
              itemBuilder: (context, item, index) {
            final post = PostModel.fromJson(item.value);
            return PopularEventCard(
              post: post,
            );
          }),
        ),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  final Color buttonColor;
  final String title;
  const CategoryButton({
    Key? key,
    required this.buttonColor,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool _isAktive = false;

  ButtonStyle? _buttonActiveTheme() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.buttonColor));
  }

  ButtonStyle? _buttonPassiveTheme() {
    return ButtonStyle(
        shadowColor: MaterialStateProperty.all(widget.buttonColor),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        elevation: MaterialStateProperty.all(20));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        style: _isAktive == true ? _buttonActiveTheme() : _buttonPassiveTheme(),
        onPressed: () {
          setState(() {
            _isAktive == true ? _isAktive = false : _isAktive = true;
          });
        },
        child: Text(widget.title),
      ),
    );
  }
}

class CardForDashBoard extends StatelessWidget {
  const CardForDashBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.orangeAccent,
      elevation: 10.0,
      child: Column(
        children: const [
          Expanded(
            child: Placeholder(),
          ),
          Expanded(
            child: Text("Title"),
          ),
        ],
      ),
    );
  }
}
