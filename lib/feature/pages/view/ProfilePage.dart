import 'package:calvesia/Utils/Style/ColorPalette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Authencitation/viewmodel/user_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(305.0),
            child: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              flexibleSpace: ProfileTopComponent(),
            ),
          ),
          body: const TabBarView(
            children: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          )
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
          FutureBuilder(
              future: UserVievModel.getMyProfilePhoto,
              builder:
                  (BuildContext context, AsyncSnapshot snapshot) {
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
                    strokeWidth: 75,
                  );
                }
              }),
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
              Tab(child: Text("Politikamiz")),
            ],
          ),
        ],
      ),
    );
  }
}
