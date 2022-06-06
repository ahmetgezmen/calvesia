import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/Authencitation/services/user_services.dart';
import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Authencitation/viewmodel/user_view_model.dart';
import '../../onboard/on_board_page.dart';
import 'profile_page_screen_widgets/change_profile_widget.dart';
import 'profile_page_screen_widgets/my_info_widget.dart';
import 'profile_page_screen_widgets/privacy_policy_widget.dart';
import 'profile_page_screen_widgets/tickets_widget.dart';
import 'profile_page_screen_widgets/calender_widget.dart';

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
            Consumer<BaseProvider>(
              builder: (context, provider, child) {
                return InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      provider.setShowNavigationButtonFunkBase();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OnboardingPage(),
                      ));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app,
                          color: BaseColorPalet.inAktiveButtonColor,
                        ),
                        Text(
                          "Sign Out",
                          style: TextStyle(
                            color: BaseColorPalet.inAktiveButtonColor,
                          ),
                        ),
                      ],
                    ));
              },
            ),
            Consumer<UserVievModel>(
              builder: (context, provider, child) {
                return FirebaseAuth.instance.currentUser!.isAnonymous
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              BaseColorPalet.buttonColor),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                    SvgPicture.asset("assets/images/Component 19.svg",),
                                     const Text(
                                          "Kullanabilmek icin lütfen giriş yapın",
                                          style: TextStyle(
                                              fontFamily: 'PTSans',
                                              fontSize: 18,
                                              )),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text("Save Profile"))
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              BaseColorPalet.buttonColor),
                        ),
                        onPressed: () async {
                          final form = provider.myInfoSaveFormKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            await Future.delayed(const Duration(seconds: 2));
                            UserServices.updateMyInfoServices(provider.user);
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Row(
                                    children: const <Widget>[
                                      Text("Güncelleme başarılı")
                                    ],
                                  ),
                                  content:
                                      const Text('Bilgileriniz Güncellendi'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Kapat'),
                                      onPressed: () {
                                        Navigator.of(dialogContext)
                                            .pop(); // Dismiss alert dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Save Profile"),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(307.0),
            child: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              flexibleSpace: const ProfileTopComponent(),
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              final result = await changeProfileImageWidgetButton(context);
              if (result == true) {
                setState(() {});
              }
            },
            child: FutureBuilder(
                future: Provider.of<UserVievModel>(context).getMyProfilePhoto,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return CircleAvatar(
                      radius: 75,
                      backgroundImage: MemoryImage(snapshot.data),
                    );
                  } else if (snapshot.hasError) {
                    return Icon(
                      Icons.error_outline,
                      size: screenHeight / 5.25,
                    );
                  } else {
                    return const CircularProgressIndicator(
                      strokeWidth: 35,
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text("Hoşgeldin",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
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
              Tab(child: Text("Biletler")),
              Tab(child: Text("Bilgilerim")),
              Tab(child: Text("Politika")),
            ],
          ),
        ],
      ),
    );
  }
}
