import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/authencitation/providers/user_providers.dart';
import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import '../Authencitation/viewmodel/user_view_model.dart';
import '../pages/post_page/post_show_page.dart';
import '../pages/services/image_services.dart';
import '../pages/services/post_services.dart';

class UpcomingEventsCardWidget extends StatefulWidget {
  final PostModel post;
  const UpcomingEventsCardWidget({Key? key, required this.post})
      : super(key: key);

  @override
  State<UpcomingEventsCardWidget> createState() =>
      _UpcomingEventsCardWidgetState();
}

class _UpcomingEventsCardWidgetState extends State<UpcomingEventsCardWidget> {
  @override
  void didUpdateWidget(covariant UpcomingEventsCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post != widget.post) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final PostModel post = widget.post;
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Card(
        shadowColor: colorsMatch(post),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: screenHeight / 7.31,
              width: screenWidth / 3.92,
              child: post.postKey == null
                  ? Container(
                      decoration: const BoxDecoration(
                        color: BaseColorPalet.upcomingCardContainer,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    )
                  : FutureBuilder(
                      future:
                          ImageServices.getPostImageServices(post.postKey, 1),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: BaseColorPalet.upcomingCardContainer,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    )),
                              ),
                              Container(
                                foregroundDecoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: MemoryImage(snapshot.data),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                            decoration: const BoxDecoration(
                                color: BaseColorPalet.upcomingCardContainer,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      post.title.toString(),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Text(
                          post.date.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "   " +
                              post.time.toString().substring(
                                  0, post.time.toString().length - 3),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: BaseColorPalet.linkLabel,
                        ),
                        Expanded(
                          child: Text(
                            post.location != null
                                ? post.location.toString()
                                : post.platformLink.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                color: BaseColorPalet.linkLabel),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, bottom: 5.0),
                              child: SizedBox(
                                  height: screenHeight / 39.05,
                                  width: screenWidth / 5.61,
                                  child: Text(post.price.toString() + " TL")),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, bottom: 5.0),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  Text(
                                    post.followersNumber.toString(),
                                    style: const TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                FirebaseAuth.instance.currentUser!.isAnonymous
                    ? const SizedBox()
                    : HookConsumer(
                        builder: (context, ref, child) {
                          return IconButton(
                            onPressed: () async {
                              final provider = ref.read(UserProvider); 
                              setState(() {
                                if (provider.isInFavList(post.postKey)) {
                                  provider.userFavListRemove(post.postKey);
                                  post.increaseFavNumber();
                                } else {
                                  provider.userFavListAdd(post.postKey);
                                  post.decreaseFavNumber();
                                }
                                PostServices.updatePostService(
                                    post, post.postKey!);
                                provider.updateMyInfo();
                              });
                            },
                            icon: ref.watch(UserProvider).isInFavList(post.postKey)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                          );
                        },
                      ),
                HookConsumer(
                  builder: (context, ref, child) {
                    return IconButton(
                      onPressed: () async {
                        ref
                            .read(BaseProvider)
                            .setShowNavigationButtonFunkPostShow();
                        await Scaffold.of(context)
                            .showBottomSheet((context) => PostShowPage(
                                  post: widget.post,
                                ))
                            .closed;
                        ref
                            .read(BaseProvider)
                            .setShowNavigationButtonFunkBase();
                      },
                      icon: const Icon(Icons.arrow_forward),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

MaterialColor? colorsMatch(PostModel post) {
  switch (post.category.toString()) {
    case "party":
      return BaseColorPalet.partyColor;
    case "career":
      return BaseColorPalet.careerColor;
    case "health":
      return BaseColorPalet.healthColor;
    case "education":
      return BaseColorPalet.educationColor;
  }
  return null;
}
