import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:flutter/material.dart';

import '../../widget/PopularEventCardWidget.dart';
import '../models/PostModel.dart';

class ExplorePage extends StatelessWidget {
  Future<void> _refeshIndicator() {
    return Future.delayed(Duration(seconds: 0));
  }

  static const List Category = [{
    "name" : "Parti",
    "color" : BaseColorPalet.PartyColor,
    "tag" : 'party'
  },{
    "name" : "Kariyer",
    "color" : BaseColorPalet.CareerColor,
    "tag" : 'career'
  },{
    "name" : "Sağlık",
    "color" : BaseColorPalet.HealthColor,
    "tag" : 'health'
  },{
    "name" : "Eğitim",
    "color" : BaseColorPalet.EducationColor,
    "tag" : 'education'
  }];
  const ExplorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: BaseColorPalet.main,
      onRefresh: _refeshIndicator,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CategoryButton(
                      title:Category[index]["name"] ,
                      buttonColor: Category[index]["color"],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 30,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: PopularEventCard(
                        title: "deneme",
                        shadowColor: colorsMatch(PostModel(
                          category: "education"
                        )) ,
                      ),
                    ),
                  );
                },
                itemCount: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  final Color buttonColor;
  final String title;
  const CategoryButton({
    Key? key,
    required this.buttonColor, required this.title,
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
            print(_isAktive);
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
        children: [
          Expanded(
            child: Placeholder(),
          ),
          Expanded(
            child: Container(
              child: Text("Title"),
            ),
          ),
        ],
      ),
    );
  }
}

MaterialColor? colorsMatch(PostModel post) {
  switch (post.category.toString()) {
    case "party":
      return BaseColorPalet.PartyColor;
    case "career":
      return BaseColorPalet.CareerColor;
    case "health":
      return BaseColorPalet.HealthColor;
    case "education":
      return BaseColorPalet.EducationColor;
  }
}
