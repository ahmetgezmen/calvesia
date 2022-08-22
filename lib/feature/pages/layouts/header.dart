import 'dart:typed_data';

import 'package:calvesia/feature/authencitation/providers/user_providers.dart';
import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:calvesia/feature/provider/header_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../profile_page/profile_page.dart';



class HeaderComponent extends ConsumerStatefulWidget {
  final TextEditingController searchController;
  const HeaderComponent({Key? key, required this.searchController})
      : super(key: key);

  @override
  ConsumerState<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends ConsumerState<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
  final userProvider = ref.watch(UserProvider);
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
            height: screenHeight / 6.5, color: Theme.of(context).primaryColor, child: null),
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
                              ref.read(BaseProvider).setShowNavigationButtonFunkProfile();
                              await Scaffold.of(context)
                                  .showBottomSheet(
                                      (context) => const ProfilePage())
                                  .closed;
                              ref.read(BaseProvider).setShowNavigationButtonFunkBase();
                            },
                            child: FutureBuilder<Uint8List?>(
                                future: userProvider.getMyProfilePhoto,
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
                          ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child:  Text(
                                FirebaseAuth.instance.currentUser!.isAnonymous
                                    ? "Anonymous"
                                    : userProvider.user.fname == null
                                        ? userProvider.user.username.toString()
                                        : userProvider.user.fname.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),

                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                    color: Color(0xff364f6c),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    onTap: () {
                      ref.read(HeaderProvider).setSelectedIndex(1);
                    },
                        onChanged: (value) {
                          ref.read(HeaderProvider).updateHeaderText(value.toString());
                        },
                        controller: widget.searchController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Etkinlik Ara",
                          border: OutlineInputBorder(),
                          //suffixIcon: Icon(
                            //Icons.filter_alt,
                          //),
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
