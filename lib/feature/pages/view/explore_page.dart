import 'package:calvesia/feature/provider/explore_page_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:provider/provider.dart';
import '../../provider/header_provider.dart';
import '../../widget/popular_event_card_widget.dart';
import '../models/post_model.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SizedBox(
            height: screenHeight / 15.62,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Consumer<ExploreProvider>(
                    builder: (context, provider, child) {
                      return CategoryButton(
                        visibility: provider.getCategory()[index]["visibility"],
                        title: provider.getCategory()[index]["name"],
                        buttonColor: provider.getCategory()[index]["color"],
                        buttonKey: provider.getCategory()[index]["tag"],
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return  SizedBox(
                  width: screenWidth / 13.09,
                );
              },
            ),
          ),
        ),
        const GridViewScrolling(),
      ],
    );
  }
}

class GridViewScrolling extends StatelessWidget {
  const GridViewScrolling({Key? key}) : super(key: key);

  gridViewController(String switchKey) {
    late final Query result;
    switch (switchKey) {
      case "Standart":
        result = FirebaseDatabase.instance
            .ref('posts')
            .orderByChild("streamTime/full");
        break;
      case "health":
        result = FirebaseDatabase.instance
            .ref('posts')
            .orderByChild("category")
            .equalTo("health");
        break;
      case "party":
        result = FirebaseDatabase.instance
            .ref('posts')
            .orderByChild("category")
            .equalTo("party");
        break;
      case "career":
        result = FirebaseDatabase.instance
            .ref('posts')
            .orderByChild("category")
            .equalTo("career");
        break;
      case "education":
        result = FirebaseDatabase.instance
            .ref('posts')
            .orderByChild("category")
            .equalTo("education");
        break;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1));
              },
              child: Consumer<HeaderProvider>(
                builder: (context, headerProvider, child) {
                  return FirebaseDatabaseQueryBuilder(
                    query: gridViewController(provider.getFetchSwitch()),
                    builder: (context, snapshot, _) {
                      if (snapshot.isFetching) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text('Something went wrong! ${snapshot.error}');
                      }
                      if (snapshot.docs.isEmpty) {
                        return const Center(child: Text('Sonuç bulunamadı'));
                      }
                      List<DataSnapshot> reversed = snapshot.docs.toList();
                      snapshot.docs.toList().forEach((element) {
                          if(PostModel.fromJson(element.value).title!.contains(headerProvider.getHeaderText)==false){
                            reversed.remove(element);
                          }
                      });

                      return GridView.builder(
                        itemCount: reversed.length,
                        itemBuilder: (context, index) {
                          // if we reached the end of the currently obtained items, we try to
                          // obtain more items
                          if (snapshot.hasMore &&
                              index + 1 == snapshot.docs.length) {
                            // Tell FirebaseDatabaseQueryBuilder to try to obtain more items.
                            // It is safe to call this function from within the build method.
                            snapshot.fetchMore();
                          }
                          final post =
                              PostModel.fromJson(reversed[index].value);
                          return PopularEventCard(post: post);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 100 / 150,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class CategoryButton extends StatefulWidget {
  final bool visibility;
  final Color buttonColor;
  final String title;
  final String buttonKey;

  const CategoryButton({
    Key? key,
    required this.buttonColor,
    required this.title,
    required this.buttonKey,
    required this.visibility,
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
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<ExploreProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          width: screenWidth / 3.27,
          child: Visibility(
            visible: widget.visibility,
            child: ElevatedButton(
              style: _isAktive == true
                  ? _buttonActiveTheme()
                  : _buttonPassiveTheme(),
              onPressed: () {
                setState(() {
                  _isAktive == true ? _isAktive = false : _isAktive = true;
                  _isAktive == true
                      ? provider.selectButton(widget.buttonKey)
                      : provider.disableAllButton();
                });
              },
              child: Text(widget.title),
            ),
          ),
        );
      },
    );
  }
}
