import 'package:calvesia/feature/Authencitation/services/user_services.dart';
import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:calvesia/feature/widget/UpcomingEventsCardWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Style/color_palette.dart';
import '../models/post_model.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SilverDelegateComponentFavourite();
  }
}

class SilverDelegateComponentFavourite extends StatefulWidget {
  const SilverDelegateComponentFavourite({
    Key? key,
  }) : super(key: key);

  @override
  State<SilverDelegateComponentFavourite> createState() =>
      _SilverDelegateComponentFavouriteState();
}

class _SilverDelegateComponentFavouriteState
    extends State<SilverDelegateComponentFavourite> {


  @override
  void initState() {
    super.initState();
  }

  Future _refreshIndicator() {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<UserVievModel>(
        builder: (context, provider, child) {
          return RefreshIndicator(
              color: BaseColorPalet.main,
              onRefresh: _refreshIndicator,
              child: Expanded(
                  child: provider.user.favList!.isEmpty ? const Center(child: Text("liste bos")) :
                      ListView.builder(
                        itemCount:  provider.user.favList!.length,
                        itemBuilder: (BuildContext context, int index){
                            return BuilderWidget(
                              provider: provider,
                              index: index,
                            );
                          },
                      )
              ));
        },
      ),
    );
  }
}

class BuilderWidget extends StatelessWidget {
  final provider;
  final index;
  const BuilderWidget({Key? key, this.provider, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: PostServices.getPostServidces( provider.user.favList![index]),
        builder: (BuildContext context,
            AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return UpcomingEventsCardWidget(post: snapshot.data);
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
