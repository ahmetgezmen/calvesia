import 'package:calvesia/feature/Authencitation/models/user_model.dart';
import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:calvesia/feature/authencitation/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Utils/Style/color_palette.dart';

enum SingingCharacter { privetEvent, publicEvent, online, platform, free, paid }
//var isValid = value.toLowerCase().endsWith('edu.tr');
// TODO edu.tr uzantılı email doğrulaması için değişken ataması örneği

/*class PostSharePage extends StatefulWidget {
  final PostIsSharingProvider postIsSharingProvider;
  final String postKey;
  const PostSharePage(
      {Key? key, required this.postKey, required this.postIsSharingProvider})
      : super(key: key);
  @override
  _PostSharePageState createState() => _PostSharePageState();
}
class _PostSharePageState extends State<PostSharePage> {
*/
// TODO form için backend sayfları oluşturulacak

class MyInfoWidgets extends StatefulWidget {
  const MyInfoWidgets({Key? key}) : super(key: key);

  @override
  State<MyInfoWidgets> createState() => _MyInfoWidgetsState();
}

class _MyInfoWidgetsState extends State<MyInfoWidgets> {
  late UserModel user;
  OutlineInputBorder singleOutlineBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: BaseColorPalet.postPageFillColor),
      borderRadius: BorderRadius.all(Radius.circular(50)));

  OutlineInputBorder singleOutlineErrorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)));

  BoxDecoration singleContainerDecoration = BoxDecoration(
      color: BaseColorPalet.postPageFillColor,
      borderRadius: BorderRadius.circular(50));

  SizedBox rowItemSpace() {
    return const SizedBox(
      width: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final providerWatch = ref.watch(UserProvider);
        return Builder(
            builder: (context) => Form(
                    key: providerWatch.myInfoSaveFormKey,
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                      //   child: Container(
                      //     decoration: singleContainerDecoration,
                      //     child: TextFormField(
                      //         decoration: InputDecoration(
                      //           labelText: "CV'ni ekle",
                      //           border: singleOutlineBorder,
                      //           disabledBorder: singleOutlineBorder,
                      //           errorBorder: singleOutlineBorder,
                      //           focusedBorder: singleOutlineBorder,
                      //           enabledBorder: singleOutlineBorder,
                      //           focusedErrorBorder: singleOutlineBorder,
                      //           suffixIcon: const Icon(
                      //             Icons.save_alt,
                      //           ),
                      //         ),
                      //         onSaved: (val) {
                      //           // TODO
                      //         }),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              initialValue: providerWatch.user.username ?? "",
                              decoration: InputDecoration(
                                labelText: "Kullanıcı Adı",
                                border: singleOutlineBorder,
                                disabledBorder: singleOutlineBorder,
                                errorBorder: singleOutlineBorder,
                                focusedBorder: singleOutlineBorder,
                                enabledBorder: singleOutlineBorder,
                                focusedErrorBorder: singleOutlineBorder,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Lütfen kullanıcı adınız giriniz';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                ref.read(UserProvider).setUserName(val);
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              initialValue: providerWatch.user.fname ?? "",
                              decoration: InputDecoration(
                                labelText: "Ad Soyad",
                                border: singleOutlineBorder,
                                disabledBorder: singleOutlineBorder,
                                errorBorder: singleOutlineBorder,
                                focusedBorder: singleOutlineBorder,
                                enabledBorder: singleOutlineBorder,
                                focusedErrorBorder: singleOutlineBorder,
                                suffixIcon: const Icon(
                                  Icons.text_fields,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ad soyad bilgisi giriniz';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                ref.read(UserProvider).setFname(val);
                              }),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: singleContainerDecoration,
                              child: DropdownButtonFormField<String>(
                                onSaved: (val) {
                                  ref.read(UserProvider).setGender(val);
                                },
                                value: providerWatch.user.gender ?? "Diger",
                                decoration: InputDecoration(
                                  labelText: "Cinsiyet",
                                  border: singleOutlineBorder,
                                  disabledBorder: singleOutlineBorder,
                                  errorBorder: singleOutlineBorder,
                                  focusedBorder: singleOutlineBorder,
                                  enabledBorder: singleOutlineBorder,
                                  focusedErrorBorder: singleOutlineBorder,
                                ),
                                items: <String>['Kadın', 'Erkek', 'Diger']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {
                                  // TODO cİnsiyet için
                                },
                              ),
                            ),
                          ),
                          rowItemSpace(),
                          Expanded(
                            child: Container(
                              decoration: singleContainerDecoration,
                              child: DropdownButtonFormField<String>(
                                  value: providerWatch.user.schools!.classNumber==null ? "1":providerWatch.user.schools!.classNumber.toString(),
                                  onSaved: (newValue) {
                                    late final int sinif;
                                    switch (newValue) {
                                      case "1":
                                        sinif = 1;
                                        break;
                                      case "2":
                                        sinif = 2;
                                        break;
                                      case "3":
                                        sinif = 3;
                                        break;
                                      case "4":
                                        sinif = 4;
                                        break;
                                      case "5":
                                        sinif = 5;
                                        break;
                                      case "6":
                                        sinif = 6;
                                        break;
                                    }
                                    ref.read(UserProvider).setSchoolClassNumber(sinif);
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Sınıf",
                                    border: singleOutlineBorder,
                                    disabledBorder: singleOutlineBorder,
                                    errorBorder: singleOutlineBorder,
                                    focusedBorder: singleOutlineBorder,
                                    enabledBorder: singleOutlineBorder,
                                    focusedErrorBorder: singleOutlineBorder,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: <String>['1', '2', '3', '4','5','6']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {}),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              initialValue: providerWatch.user.schools!.name ?? "",
                              decoration: InputDecoration(
                                labelText: "Okul adı giriniz",
                                border: singleOutlineBorder,
                                disabledBorder: singleOutlineBorder,
                                errorBorder: singleOutlineBorder,
                                focusedBorder: singleOutlineBorder,
                                enabledBorder: singleOutlineBorder,
                                focusedErrorBorder: singleOutlineBorder,
                                suffixIcon: const Icon(
                                  Icons.text_fields,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Okulunuz giriniz ';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                ref.read(UserProvider).setSchoolName(val);
                              }),
                        ),
                      ),
                      Container(
                        decoration: singleContainerDecoration,
                        child: TextFormField(
                            initialValue: providerWatch.user.phone ?? "",
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Telefon numarası",
                              border: singleOutlineBorder,
                              disabledBorder: singleOutlineBorder,
                              errorBorder: singleOutlineBorder,
                              focusedBorder: singleOutlineBorder,
                              enabledBorder: singleOutlineBorder,
                              focusedErrorBorder: singleOutlineBorder,
                              suffixIcon: const Icon(
                                Icons.text_fields,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Telefon numarası boş bırakılamaz ! ';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              ref.read(UserProvider).setPhone(val);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              initialValue: providerWatch.user.password ?? "",
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Parola Giriniz",
                                border: singleOutlineBorder,
                                disabledBorder: singleOutlineBorder,
                                errorBorder: singleOutlineBorder,
                                focusedBorder: singleOutlineBorder,
                                enabledBorder: singleOutlineBorder,
                                focusedErrorBorder: singleOutlineBorder,
                                suffixIcon: const Icon(
                                  Icons.text_fields,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Parolanızı onaylayınız ! ';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                ref.read(UserProvider).setPassword(val);
                              }),
                        ),
                      ),
                      Container(
                        decoration: singleContainerDecoration,
                        child: TextFormField(
                          initialValue: providerWatch.user.email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email adresi",
                              border: singleOutlineBorder,
                              disabledBorder: singleOutlineBorder,
                              errorBorder: singleOutlineBorder,
                              focusedBorder: singleOutlineBorder,
                              enabledBorder: singleOutlineBorder,
                              focusedErrorBorder: singleOutlineBorder,
                              suffixIcon: const Icon(
                                Icons.text_fields,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email adresinizi giriniz ! ';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              ref.read(UserProvider).user.setEmail(val);
                            }),
                      )
                    ]),
                  ),
                )));
      },
    );
  }
}
