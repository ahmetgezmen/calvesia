import 'dart:typed_data';

import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:calvesia/feature/pages/models/PostModel.dart';
import 'package:flutter/material.dart';

import '../../widget/PopularEventCardWidget.dart';
import '../../widget/UpcomingEventsCardWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<void> _refeshIndicator() {
    return Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: BaseColorPalet.main,
      onRefresh: _refeshIndicator,
      child: ListView(
        children: [
          BodyComponent(),
          BottomComponent(),
        ],
      ),
    );
  }
}

class BottomComponent extends StatelessWidget {
  const BottomComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Yaklaşan Etkinlikler",
                  style: Theme.of(context).textTheme.headline6),
              Text("See all"),
            ],
          ),
        ),
        for (int i = 0; i < 15; i++)
          UpcomingEventsCardWidget(
            post: PostModel(),
          )
      ],
    );
  }
}

class BodyComponent extends StatelessWidget {
  const BodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Populer Etkinlikler",
                    style: Theme.of(context).textTheme.headline6),
                Text("See all"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PopularEventCard(post: PostModel(),);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
