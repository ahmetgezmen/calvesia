import 'package:calvesia/feature/onboard/view/ProfilePage.dart';
import 'package:flutter/material.dart';

import '../../widget/PopularEventCardWidget.dart';
import '../../widget/UpcomingEventsCardWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          TopComponenet(),
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
    for (int i=0; i<15; i++)
      UpcomingEventsCardWidget(title: 'GELECEK ETKINLIKLER',)
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
            padding: const EdgeInsets.only(top: 10.0,left: 20),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PopularEventCard(title: 'data');
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class TopComponenet extends StatelessWidget {
  const TopComponenet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 120.0, color: Theme.of(context).primaryColor, child: null),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      InkWell(
                      onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return ProfilePage();
                          }));
                      },
                        child: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Ahmet GEZMEN",
                            style: Theme.of(context).textTheme.headlineSmall),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    decoration: const  InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Etkinlik Ara",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.filter_alt,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
