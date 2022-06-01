import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:calvesia/feature/pages/services/image_services.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
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
    final post = widget.post;
    return Card(
      borderOnForeground: true,
      shadowColor: colorsMatch(post),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Stack(
                children: [
                  post.postKey == null
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
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color:
                                          BaseColorPalet.upcomingCardContainer,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    foregroundDecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15.0),
                                      ),
                                      image:DecorationImage(image: MemoryImage(snapshot.data),
                                      fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: BaseColorPalet.upcomingCardContainer,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0),
                                  ),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                  Consumer<UserVievModel>(
                    builder: (context, provider, child) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            setState(() {
                              if (provider.user.favList!
                                  .contains(post.postKey)) {
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
                          icon: provider.isInFavList(post.postKey)
                              ? Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 10,
                                  child: const SizedBox(
                                    height: 35,
                                    width: 35,
                                    child:  Icon(Icons.favorite,
                                        color: BaseColorPalet.cardBackground),
                                  ),
                                )
                              : Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 10,
                                  child: const SizedBox(
                                    height: 35,
                                    width: 35,
                                    child:  Icon(Icons.favorite_border,
                                        color: BaseColorPalet.cardBackground),
                                  ),
                                ),
                        ),
                      );
                    },
                  )
                ],
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                post.date.toString(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            post.title.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
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
                                  post.location.toString(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                            width: 70,
                            child: Text(post.price.toString() + " TL"),
                          ),
                          Text(post.time.toString()),
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
