import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:calvesia/feature/pages/post_page/post_show_page.dart';
import 'package:calvesia/feature/pages/services/image_services.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/Style/color_palette.dart';

class PopularEventCard extends StatefulWidget {
  final PostModel post;
  const PopularEventCard({Key? key, required this.post}) : super(key: key);

  @override
  State<PopularEventCard> createState() => _PopularEventCardState();
}

class _PopularEventCardState extends State<PopularEventCard> {
  @override
  void didUpdateWidget(covariant PopularEventCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post != widget.post) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final post = widget.post;
    return Stack(
      children: [
        Consumer<BaseProvider>(
          builder: (context, provider, child) {
            return InkWell(
              onTap: () async {
                provider.setShowNavigationButtonFunkPostShow();
                await Scaffold.of(context)
                    .showBottomSheet((context) => PostShowPage(
                          post: widget.post,
                        ))
                    .closed;
                provider.setShowNavigationButtonFunkBase();
              },
              child: Card(
                borderOnForeground: true,
                shadowColor: colorsMatch(post),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Center(
                  child: SizedBox(
                    width: screenWidth / 1.57,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: post.postKey == null
                              ? Container(
                                  decoration: const BoxDecoration(
                                    color: BaseColorPalet.upcomingCardContainer,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                  ),
                                )
                              : FutureBuilder(
                                  future: ImageServices.getPostImageServices(
                                      post.postKey, 1),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: BaseColorPalet
                                                  .upcomingCardContainer,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            foregroundDecoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(15.0),
                                              ),
                                              image: DecorationImage(
                                                image:
                                                    MemoryImage(snapshot.data),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          color: BaseColorPalet
                                              .upcomingCardContainer,
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15.0),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  }),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.5, right: 20.0, left: 20.0, bottom: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          post.date.toString(),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      post.title.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      maxLines: 2,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: BaseColorPalet.linkLabel,
                                          ),
                                          Text(
                                            post.location != null ? post.location.toString(): post.platformLink.toString(),
                                            style: const TextStyle(
                                              color: BaseColorPalet.linkLabel,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      height: screenHeight / 39.05,
                                      width: screenWidth / 5.61,
                                      child:
                                          Text(post.price.toString() + " TL"),
                                    ),
                                    Text(post.time.toString().substring(0,post.time.toString().length-3)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: screenWidth / 1.57,
            child: Consumer<UserVievModel>(
              builder: (context, provider, child) {
                return Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        if (provider.user.favList!.contains(post.postKey)) {
                          provider.userFavListRemove(post.postKey);
                          post.increaseFavNumber();
                        } else {
                          provider.userFavListAdd(post.postKey);
                          post.decreaseFavNumber();
                        }
                        PostServices.updatePostService(post, post.postKey!);
                        provider.updateMyInfo();
                      });
                    },
                    icon: provider.isInFavList(post.postKey)
                        ? Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 10,
                            child:  SizedBox(
                              height: screenHeight / 22.31,
                              width: screenWidth / 11.22,
                              child: const Icon(Icons.favorite),
                            ),
                          )
                        : Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 10,
                            child:  SizedBox(
                              height: screenHeight / 22.31,
                              width: screenWidth / 11.22,
                              child: const Icon(Icons.favorite_border),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        )
      ],
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
