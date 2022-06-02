import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/widget/UpcomingEventsCardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';


import '../models/post_model.dart';

class PopularSeeAllPage extends StatelessWidget {
  const PopularSeeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Yaklaşan Etkinlikler"),
        backgroundColor: BaseColorPalet.main,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FirebaseDatabaseQueryBuilder(
          pageSize: 10,
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

            return ListView.builder(
              itemCount: snapshot.docs.length,
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
                PostModel.fromJson(snapshot.docs[index].value);
                return UpcomingEventsCardWidget(post: post);
              },
            );
          },
        ),
      ),
    );
  }
}
