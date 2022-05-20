import 'dart:typed_data';

import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:calvesia/feature/provider/header_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Authencitation/viewmodel/user_view_model.dart';
import '../profile_page/profile_page.dart';

class HeaderComponent extends StatefulWidget {
  final TextEditingController searchController;
  const HeaderComponent({Key? key, required this.searchController}) : super(key: key);

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 120.0, color: Theme.of(context).primaryColor, child: null),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Consumer<BaseProvider>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () async {
                              value.isShowNavigationButtonFunk();
                              Scaffold.of(context)
                                  .showBottomSheet((context) => ProfilePage())
                                  .closed
                                  .then((_) {
                                value.isShowNavigationButtonFunk();
                              });
                            },
                            child: FutureBuilder<Uint8List?>(
                                future: UserVievModel.getMyProfilePhoto,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CircleAvatar(
                                      backgroundImage:
                                          MemoryImage(snapshot.data!),
                                    );
                                  } else {
                                    return const CircleAvatar(
                                      child: Icon(Icons.person),
                                    );
                                  }
                                }),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                            FirebaseAuth.instance.currentUser!.isAnonymous
                                ? "Anonymous"
                                : "Ahmet GEZMEN",
                            style: Theme.of(context).textTheme.headlineSmall),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Consumer<HeaderProvider>(
                    builder: (context, provider, child) {
                      return TextFormField(
                        onChanged: (value) {
                          provider.updateHeaderText(value.toString());
                          print(provider.getHeaderText);
                        },
                        controller: widget.searchController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Etkinlik Ara",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.filter_alt,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
