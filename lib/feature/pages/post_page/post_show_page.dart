import 'dart:typed_data';

import 'package:calvesia/feature/pages/models/post_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Style/color_palette.dart';
import '../../Authencitation/viewmodel/user_view_model.dart';
import '../services/image_services.dart';
import '../services/post_services.dart';
import 'page_indicator.dart';

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
                  backgroundColor:
                      MaterialStateProperty.all(BaseColorPalet.buttonColor)),
              onPressed: () {},
              child: const Text(
                "Bilet AL",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
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
  CommentComponent({Key? key, required this.post}) : super(key: key);

  final OutlineInputBorder singleOutlineBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: BaseColorPalet.postPageFillColor),
      borderRadius: BorderRadius.all(Radius.circular(50)));

  final BoxDecoration singleContainerDecoration = BoxDecoration(
      color: BaseColorPalet.postPageFillColor,
      borderRadius: BorderRadius.circular(50));
  @override
  Widget build(BuildContext context) {
    return const Text("Coming Soon");
    // Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 16.0),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: Container(
    //               decoration: singleContainerDecoration,
    //               child: TextFormField(
    //                   decoration: InputDecoration(
    //                     labelText: "Yorum yaz",
    //                     border: singleOutlineBorder,
    //                     disabledBorder: singleOutlineBorder,
    //                     errorBorder: singleOutlineBorder,
    //                     focusedBorder: singleOutlineBorder,
    //                     enabledBorder: singleOutlineBorder,
    //                     focusedErrorBorder: singleOutlineBorder,
    //                     suffixIcon: const Icon(
    //                       Icons.text_fields,
    //                     ),
    //                   ),
    //                   validator: (value) {
    //                     if (value!.isEmpty) {
    //                       return 'Ad soyad bilgisi giriniz';
    //                     }
    //                     return null;
    //                   },
    //                   onSaved: (val) {
    //                     // Todo
    //                   }),
    //             ),
    //           ),
    //           IconButton(
    //             onPressed: () {},
    //             icon: const Icon(Icons.arrow_forward_ios),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}

class InfoComponent extends StatelessWidget {
  final PostModel post;
  const InfoComponent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
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
                  SizedBox(
                    width: screenWidth / 13.1,
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
                    SizedBox(
                      width: screenWidth / 13.1,
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
                    SizedBox(
                      width: screenWidth / 13.1,
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
                    SizedBox(
                      width: screenWidth / 13.1,
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
                    SizedBox(
                      width: screenWidth / 13.1,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(post.eventWebSiteUrl.toString()),
                        ],
                      ),
                    ))
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
            SizedBox(
              height: screenHeight / 78.1,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(post.description.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 39.05,
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
                        height: screenHeight / 7.81,
                        child: ListView.builder(
                          itemCount: post.sponsors!.sponsors!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      SizedBox(
                                        width: screenWidth / 13.1,
                                      ),
                                      Text(post.sponsors!.sponsors![index]
                                          .toString()
                                          .trim()),
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
                  "Koordinatorler",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            post.coordinators != null
                ? post.coordinators!.coordinators != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: screenHeight / 3.9,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.person_outline),
                                        SizedBox(
                                          width: screenWidth / 13.1,
                                        ),
                                        Text(post
                                            .coordinators!.coordinators![index]
                                            .trim()),
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  BaseColorPalet.buttonColor)),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                  title: Text("Coming Soon"));
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
                        child: Text("Koordinator Bulunamadi"),
                      )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Koordinator Bulunamadi"),
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
                height: screenHeight / 7.5,
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              PictureComponent(post: widget.post),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
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
                                child: SizedBox(
                                  height: screenHeight / 22.31,
                                  width: screenWidth / 11.22,
                                  child: const Icon(
                                    Icons.favorite,
                                  ),
                                ),
                              )
                            : Material(
                                borderRadius: BorderRadius.circular(20),
                                elevation: 10,
                                child: SizedBox(
                                  height: screenHeight / 22.31,
                                  width: screenWidth / 11.22,
                                  child: const Icon(
                                    Icons.favorite_border,
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
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

class PictureComponent extends StatefulWidget {
  final PostModel post;
  const PictureComponent({Key? key, required this.post}) : super(key: key);

  @override
  State<PictureComponent> createState() => _PictureComponentState();
}

class _PictureComponentState extends State<PictureComponent> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future<List<Uint8List>> getting() async {
    List<Uint8List> imageList = [];
    try {
      final image1 =
          await ImageServices.getPostImageServices(widget.post.postKey, 1);
      imageList.add(image1);
    } catch (e) {}
    try {
      final image2 =
          await ImageServices.getPostImageServices(widget.post.postKey, 2);
      imageList.add(image2);
    } catch (e) {}
    try {
      final image3 =
          await ImageServices.getPostImageServices(widget.post.postKey, 3);
      imageList.add(image3);
    } catch (e) {}
    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(25),
      shadowColor: BaseColorPalet.main,
      child: FutureBuilder<List<Uint8List>>(
        future: getting(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List dataList = snapshot.data;
            if(dataList.isEmpty){
              return Container(
                decoration: const BoxDecoration(
                  color: BaseColorPalet.upcomingCardContainer,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                    bottom: Radius.circular(25.0),
                  ),
                ),
              );
            }
            return Stack(
              children: [
                PageView(
                  controller: controller,
                  children: [
                    for (int i = 0; i < dataList.length; i++)
                      Container(
                        foregroundDecoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(25.0),
                            bottom: Radius.circular(25.0),
                          ),
                          image: DecorationImage(
                            image: MemoryImage(snapshot.data[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PageIndicator(controller: controller, count: dataList.length,),
                ),
              ],
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
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            Image(width: 85, image: MemoryImage(snapshot.data)),
                      );
                    },
                  );
                },
                child: Image(width: 85, image: MemoryImage(snapshot.data)),
              );
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
