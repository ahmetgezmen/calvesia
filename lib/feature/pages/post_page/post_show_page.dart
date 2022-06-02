import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:calvesia/feature/pages/models/sponsor_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Style/color_palette.dart';
import '../../Authencitation/viewmodel/user_view_model.dart';
import '../services/image_services.dart';
import '../services/post_services.dart';

class PostShowPageAppBarr extends StatelessWidget {
  const PostShowPageAppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Get Ticket one Person"),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BaseColorPalet.buttonColor)
              ),
              onPressed: () {},
              child: const Text("Bilet AL"),
            )
          ],
        ),
      ),
    );
  }
}

class PostShowPage extends StatelessWidget {
  final PostModel post;
  const PostShowPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width * 0.8),
            child: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              leading: const SizedBox(),
              flexibleSpace: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TopComponent(
                    post: post,
                  )),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Tab(
                    child: InfoComponent(
                  post: post,
                )),
                Tab(
                    child: CommentComponent(
                  post: post,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentComponent extends StatelessWidget {
  final PostModel post;
  const CommentComponent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class InfoComponent extends StatelessWidget {
  final PostModel post;
  const InfoComponent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: BaseColorPalet.inAktiveButtonColor)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(post.title.toString()),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: BaseColorPalet.inAktiveButtonColor)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(post.date.toString() + ', ' + post.time.toString()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: BaseColorPalet.inAktiveButtonColor)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(post.endDate.toString() +
                        ', ' +
                        post.endTime.toString()),
                  ],
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: BaseColorPalet.inAktiveButtonColor)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(post.location.toString()),
                            ],
                          )),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: BaseColorPalet.inAktiveButtonColor)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.link),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(post.eventWebSiteUrl.toString())
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Açıklama",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(post.description.toString(), maxLines: 10)),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sponsorlar",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            post.sponsors != null
                ? post.sponsors!.sponsors != null
                    ? SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: post.sponsors!.sponsors!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Container(decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50)
                                ),),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration:BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(post.sponsors!.sponsors![index].toString().trimLeft()),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Sponsor Bulunamadi"),
                      )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sponsor Bulunamadi"),
                  ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kordinatorler",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            post.coordinators != null
                ? post.coordinators!.coordinators != null
                    ? Container(
              decoration: BoxDecoration(
              color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),

              ),
                        height: 200,
                        child: ListView.builder(
                          itemCount: post.coordinators!.coordinators!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(children: [const Icon(Icons.person_outline),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(post
                                          .coordinators!.coordinators![index]),],),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(BaseColorPalet.buttonColor)
                                      ),
                                      onPressed: () {
                                        showDialog(context: context, builder: (context){
                                          return const AlertDialog(title: Text("Coming Soon"));
                                        });
                                      },
                                      child: const Text("İletişime geç"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Kordinator Bulunamadi"),
                      )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Kordinator Bulunamadi"),
                  ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Afişler",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: 100,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    PhotoWidget(
                      post: post,
                      index: 1,
                    ),
                    PhotoWidget(
                      post: post,
                      index: 2,
                    ),
                    PhotoWidget(
                      post: post,
                      index: 3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopComponent extends StatefulWidget {
  final PostModel post;
  const TopComponent({Key? key, required this.post}) : super(key: key);

  @override
  State<TopComponent> createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              PictureComponent(post: widget.post),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Expanded(
                  child: Consumer<UserVievModel>(
                    builder: (context, provider, child) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            setState(() {
                              if (provider.user.favList!
                                  .contains(widget.post.postKey)) {
                                provider.userFavListRemove(widget.post.postKey);
                                widget.post.increaseFavNumber();
                              } else {
                                provider.userFavListAdd(widget.post.postKey);
                                widget.post.decreaseFavNumber();
                              }
                              PostServices.updatePostService(
                                  widget.post, widget.post.postKey!);
                              provider.updateMyInfo();
                            });
                          },
                          icon: provider.isInFavList(widget.post.postKey)
                              ? Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 10,
                                  child: const SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.favorite,
                                        color: BaseColorPalet.cardBackground),
                                  ),
                                )
                              : Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 10,
                                  child: const SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.favorite_border,
                                        color: BaseColorPalet.cardBackground),
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        const TabBar(
          indicatorColor: BaseColorPalet.main,
          tabs: [
            Tab(child: Text("Detaylar")),
            Tab(child: Text("Yorumlar")),
          ],
        ),
      ],
    );
  }
}

class PictureComponent extends StatelessWidget {
  final PostModel post;
  const PictureComponent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(25),
        shadowColor: BaseColorPalet.main,
        child: Expanded(
          child: FutureBuilder(
            future: ImageServices.getPostImageServices(post.postKey, 1),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  foregroundDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25.0),
                      bottom: Radius.circular(25.0),
                    ),
                    image: DecorationImage(
                      image: MemoryImage(snapshot.data),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  decoration: const BoxDecoration(
                    color: BaseColorPalet.upcomingCardContainer,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                      bottom: Radius.circular(25.0),
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  final int index;
  final PostModel post;
  const PhotoWidget({Key? key, required this.post, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: ImageServices.getPostImageServices(post.postKey, index),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Image(width: 85, image: MemoryImage(snapshot.data));
            } else if (snapshot.hasError) {
              return Container(
                width: 85,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: BaseColorPalet.postPageFillColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      child: Icon(Icons.photo_camera_outlined),
                    ),
                    Text("Fotoğraf"),
                    Text("eklenmedi"),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}