import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:calvesia/feature/onboard/models/PostModel.dart';
import 'package:flutter/material.dart';

import '../../widget/PopularEventCardWidget.dart';
import '../layouts/Header.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderComponent(),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return CategoryButtonWidgetActive(
                  buttonColor: Colors.orangeAccent,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(100, (index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopularEventCard(title: "deneme"),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryButtonWidgetInActive extends StatelessWidget {
  final Color buttonColor;
  const CategoryButtonWidgetInActive({
    Key? key,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: 100,
      child: InkWell(
        onTap: () {},
        child: Center(child: Text("bas")),
      ),
    );
  }
}

class CategoryButtonWidgetActive extends StatelessWidget {
  final Color buttonColor;
  const CategoryButtonWidgetActive({
    Key? key,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: buttonColor,
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: 100,
        child: InkWell(
          onTap: () {},
          child: Center(child: Text("bas")),
        ),
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
