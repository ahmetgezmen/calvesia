import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:calvesia/feature/widget/upcoming_events_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Style/color_palette.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser!.isAnonymous ? const Center(child: Text("Kullanabilmek icin lutfen giris yapin"),):const SilverDelegateComponentFavourite();
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
  final UserVievModel provider;
  final int index;
  const BuilderWidget({Key? key, required this.provider, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: PostServices.getPostServidces( provider.user.favList![index]),
        builder: (BuildContext context,
            AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return UpcomingEventsCardWidget(post: snapshot.data);
          } else if (snapshot.hasError) {
            return const Icon(Icons.error_outline);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
