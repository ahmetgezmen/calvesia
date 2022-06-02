import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Authencitation/viewmodel/user_view_model.dart';
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
    final PostModel post = widget.post;
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            post.viewNumber.toString() + " k",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
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
                            post.location.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                color: BaseColorPalet.linkLabel),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                    child: SizedBox(
                        height: 20,
                        width: 70,
                        child: Text(post.price.toString() + " TL")),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Consumer<UserVievModel>(
                  builder: (context, provider, child) {
                    return IconButton(
                      onPressed: () async {
                        setState(() {
                          if (provider.isInFavList(post.postKey)) {
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
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
