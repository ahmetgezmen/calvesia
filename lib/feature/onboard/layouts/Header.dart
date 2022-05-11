
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Authencitation/viewmodel/UserViewModel.dart';
import '../view/ProfilePage.dart';

class HeaderComponent extends StatefulWidget {
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
                      InkWell(
                        onTap: () async {
                          final value = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfilePage();
                              },
                            ),
                          );
                          setState(() {});
                        },
                        child: FutureBuilder<Uint8List?>(
                            future: UserVievModel.getMyProfilePhoto,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return CircleAvatar(
                                  backgroundImage: MemoryImage(snapshot.data!),
                                );
                              } else {
                                return const CircleAvatar(
                                  child: Icon(Icons.person),
                                );
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(FirebaseAuth.instance.currentUser != null
                            ? FirebaseAuth.instance.currentUser!.displayName.toString()
                            : "Anonymous",
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
                  child: TextFormField(
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
