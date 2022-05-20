import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Authencitation/viewmodel/user_view_model.dart';
import '../../onboard/OnBoardPage.dart';
import 'ProfileScreenWidgets/calender_widget.dart';
import 'ProfileScreenWidgets/change_profile_widget.dart';
import 'ProfileScreenWidgets/my_info_widget.dart';
import 'ProfileScreenWidgets/privacy_policy_widget.dart';
import 'ProfileScreenWidgets/tickets_widget.dart';

class ProfilePageAppBarr extends StatelessWidget {
  const ProfilePageAppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OnboardingPage(),
                  ));
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: BaseColorPalet.InAktiveButtonColor,
                    ),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                        color: BaseColorPalet.InAktiveButtonColor,
                      ),
                    ),
                  ],
                )),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(BaseColorPalet.buttonColor),
              ),
              onPressed: () {},
              child: const Text("Save Profile"),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: FirebaseAuth.instance.currentUser!.isAnonymous ? const Size.fromHeight(230.0) : const Size.fromHeight(305.0),
            child: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              flexibleSpace: ProfileTopComponent(),
            ),
          ),
          body: const TabBarView(
            children: [
              Tab(child: CalenderWidget()),
              Tab(child: TicketsWidget()),
              Tab(child: MyInfoWidgets()),
              Tab(child: ProvacPolicyWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTopComponent extends StatefulWidget {
  const ProfileTopComponent({Key? key}) : super(key: key);

  @override
  State<ProfileTopComponent> createState() => _ProfileTopComponentState();
}

class _ProfileTopComponentState extends State<ProfileTopComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              ChangeProfileImageWidgetButton(context);
            },
            child: FutureBuilder(
                future: UserVievModel.getMyProfilePhoto,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return CircleAvatar(
                      radius: 75,
                      backgroundImage: MemoryImage(snapshot.data),
                    );
                  } else if (snapshot.hasError) {
                    return const Icon(
                      Icons.error_outline,
                      size: 75,
                    );
                  } else {
                    return const CircularProgressIndicator(
                      strokeWidth: 35,
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text("Hoşgeldin",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
                FirebaseAuth.instance.currentUser!.isAnonymous
                    ? "Anonymous"
                    : "Ahmet GEZMEN",
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          const TabBar(
            indicatorColor: BaseColorPalet.main,
            tabs: [
              Tab(child: Text("Takvim")),
              Tab(child: Text("Biletlerim")),
              Tab(child: Text("Bilgilerim")),
              Tab(child: Text("Politika")),
            ],
          ),
        ],
      ),
    );
  }
}
