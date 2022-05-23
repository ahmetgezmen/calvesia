import 'package:calvesia/feature/Authencitation/models/user_model.dart';
import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();*/
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
    return Consumer<UserVievModel>(
      builder: (context, provider, child) {
        return Builder(
            builder: (context) => Form(
                    //key: _formKey,
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "CV'ni ekle",
                                border: singleOutlineBorder,
                                disabledBorder: singleOutlineBorder,
                                errorBorder: singleOutlineBorder,
                                focusedBorder: singleOutlineBorder,
                                enabledBorder: singleOutlineBorder,
                                focusedErrorBorder: singleOutlineBorder,
                                suffixIcon: const Icon(
                                  Icons.save_alt,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '    Lütfen Cv nizi yükleyiniz';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                // TODO
                              }),
                        ),
                      ),
                      Container(
                        decoration: singleContainerDecoration,
                        child: TextFormField(
                            initialValue: provider.user.username ?? "",
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
                              provider.setUserName(val);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              initialValue: provider.user.fname ?? "",
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
                                provider.setFname(val);
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
                                onSaved: (newValue) {
                                  // TODO
                                },
                                value: "Diger",
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
                                  value: "1",
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
                                    }
                                    //TODO
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
                                  items: <String>['1', '2', '3', '4']
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
                              initialValue: provider.user.schools!.name ?? "",
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
                                provider.setSchoolName(val);
                              }),
                        ),
                      ),
                      Container(
                        decoration: singleContainerDecoration,
                        child: TextFormField(
                            initialValue: provider.user.phone ?? "",
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
                              provider.setPhone(val);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: singleContainerDecoration,
                          child: TextFormField(
                              initialValue: provider.user.password ?? "",
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
                                provider.setPassword(val);
                              }),
                        ),
                      ),
                      Container(
                        decoration: singleContainerDecoration,
                        child: TextFormField(
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
                              // TODO
                            }),
                      )
                    ]),
                  ),
                )));
      },
    );
  }
}
