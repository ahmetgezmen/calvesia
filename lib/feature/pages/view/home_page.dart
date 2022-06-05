

import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';

import '../../widget/popular_event_card_widget.dart';
import '../../widget/upcoming_events_card_widget.dart';
import '../see_all_page/popular_see_all_page.dart';
import '../see_all_page/upcoming_see_all_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<void> _refeshIndicator() {
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: BaseColorPalet.main,
      onRefresh: _refeshIndicator,
      child: ListView(
        children: const [
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
              TextButton(onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const UpcomingSeeAllPage();
                },));
              },
              child: const Text("Tümünü gör", style: TextStyle(color: Color(0xff169cad)),)),
            ],
          ),
        ),
        FirebaseDatabaseQueryBuilder(
            query: FirebaseDatabase.instance
                .ref('posts')
                .orderByChild("date"),
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
              return Column(children: [
                for(int index = 0 ; index<snapshot.docs.length;index++)
                  UpcomingEventsCardWidget(post: PostModel.fromJson(snapshot.docs.toList()[index].value))
              ]);
            })
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
                TextButton(onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PopularSeeAllPage(),));
                },
                child: const Text("Tümünü gör", style: TextStyle(color: Color(0xff169cad)),)),
              ],
            ),
          ),
          FirebaseDatabaseQueryBuilder(
              query: FirebaseDatabase.instance
                  .ref('posts')
                  .orderByChild("followersNumber"),
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
                return SizedBox(
                  height: 300,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                    for(int index = 0 ; index<snapshot.docs.length;index++)
                      PopularEventCard(post: PostModel.fromJson(snapshot.docs.toList()[index].value))
                  ]),
                );
              })
        ],
      ),
    );
  }
}
