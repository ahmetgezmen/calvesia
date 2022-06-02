import 'package:calvesia/feature/widget/UpcomingEventsCardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';

import '../models/post_model.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  late Query query = FirebaseDatabase.instance
      .ref('posts')
      .orderByChild("date")
      .equalTo(DateTime.now().toString().split(" ")[0]);

  setQueryForDay(String day) {
    query = FirebaseDatabase.instance
        .ref('posts')
        .orderByChild("date")
        .equalTo(day.split(" ")[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 1),
            lastDate: DateTime(DateTime.now().year + 1),
            onDateChanged: (day) {
              setState((){
                setQueryForDay(day.toString());
              });
            }),
        FirebaseDatabaseQueryBuilder(
          query: query,
          builder: (BuildContext context, FirebaseQueryBuilderSnapshot snapshot,
              Widget? child) {
            if (snapshot.isFetching) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            }
            if (snapshot.docs.isEmpty) {
              return const Center(child: Text('Bu tarihte gerçekleşen etkinlik yok'));
            }
            int len = snapshot.docs.length;
            for (int index = 0; index <= len; index++) {
              return UpcomingEventsCardWidget(
                post: PostModel.fromJson(snapshot.docs[index].value),
              );
            }
            return Divider();
          },
        )
      ],
    );
  }
}
