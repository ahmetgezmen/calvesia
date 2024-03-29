import 'package:calvesia/feature/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../Utils/Style/color_palette.dart';
import 'event_photo_component.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SingingCharacter { privetEvent, publicEvent, online, platform, free, paid }

class PostSharePage extends StatefulWidget {
  final  postIsSharingProvider;
  final String postKey;
  const PostSharePage(
      {Key? key, required this.postKey, required this.postIsSharingProvider})
      : super(key: key);

  @override
  _PostSharePageState createState() => _PostSharePageState();
}

class _PostSharePageState extends State<PostSharePage> {
  final _formKey = GlobalKey<FormState>();
  //final _post = Post();
  // todo post_model.dart ile birleştikten sonra form alma işlemi
  TextEditingController dateCtlStart = TextEditingController();
  TextEditingController dateCtlEnd = TextEditingController();
  TextEditingController timeInputStart = TextEditingController();
  TextEditingController timeInputEnd = TextEditingController();

  @override
  void dispose() {
    timeInputEnd.dispose();
    timeInputStart.dispose();
    dateCtlStart.dispose();
    dateCtlEnd.dispose();
    super.dispose();
  }

  @override
  void initState() {
    timeInputStart.text = ""; //set the initial value of text field
    timeInputEnd.text = ""; //set the initial value of text field
    super.initState();
  }

  SingingCharacter _privateController = SingingCharacter.privetEvent;
  SingingCharacter _isOnlineController = SingingCharacter.platform;
  SingingCharacter _character3 = SingingCharacter.paid;

  SizedBox rowItemSpace() {
    return const SizedBox(
      width: 30,
    );
  }

  OutlineInputBorder singleOutlineBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: BaseColorPalet.postPageFillColor),
      borderRadius: BorderRadius.all(Radius.circular(50)));
  OutlineInputBorder singleOutlineErrorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)));
  BoxDecoration singleContainerDecoration = BoxDecoration(
      color: BaseColorPalet.postPageFillColor,
      borderRadius: BorderRadius.circular(50));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Etkinlik Oluştur'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: HookConsumer(
          builder: (context, ref, child) {
            return Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: singleContainerDecoration,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Etkinlik Başlığı',
                                    border: singleOutlineBorder,
                                    disabledBorder: singleOutlineBorder,
                                    errorBorder: singleOutlineBorder,
                                    focusedBorder: singleOutlineBorder,
                                    enabledBorder: singleOutlineBorder,
                                    focusedErrorBorder: singleOutlineBorder,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '    Lütfen etkinlik ismi giriniz';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    ref.read(PostShareProvider).setTitle(val.toString());
                                  }),
                            ),
                          ),
                          Container(
                            decoration: singleContainerDecoration,
                            child: DropdownButtonFormField<String>(
                              onChanged: (_) {},
                              value: "Parti",
                              decoration: InputDecoration(
                                labelText: "Etkinlik kategorisi",
                                border: singleOutlineBorder,
                                disabledBorder: singleOutlineBorder,
                                errorBorder: singleOutlineBorder,
                                focusedBorder: singleOutlineBorder,
                                enabledBorder: singleOutlineBorder,
                                focusedErrorBorder: singleOutlineBorder,
                              ),
                              items: <String>[
                                'Parti',
                                'Kariyer',
                                'Sağlık',
                                'Eğitim'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onSaved: (val) {
                                late final String category;
                                switch (val) {
                                  case 'Parti':
                                    category = "party";
                                    break;
                                  case 'Kariyer':
                                    category = "career";
                                    break;
                                  case 'Sağlık':
                                    category = "health";
                                    break;
                                  case 'Eğitim':
                                    category = "education";
                                    break;
                                }
                                ref.read(PostShareProvider).setCategory(category);
                              },
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text('Özel Etkinlik'),
                                  value: SingingCharacter.publicEvent,
                                  groupValue: _privateController,
                                  onChanged: (value) {
                                    setState(() {
                                      _privateController = value!;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text('Herkese Açık'),
                                  value: SingingCharacter.privetEvent,
                                  groupValue: _privateController,
                                  onChanged: (value) {
                                    setState(() {
                                      _privateController = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: singleContainerDecoration,
                                    child: TextFormField(
                                      onSaved: (newValue) {
                                        ref.read(PostShareProvider).setDate(newValue);
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "    Lütfen tarih\n    seçiniz";
                                        }
                                        return null;
                                      },
                                      controller: dateCtlStart,
                                      decoration: InputDecoration(
                                        labelText: "Başlangıç tarihi",
                                        border: singleOutlineBorder,
                                        disabledBorder: singleOutlineBorder,
                                        errorBorder: singleOutlineBorder,
                                        focusedBorder: singleOutlineBorder,
                                        enabledBorder: singleOutlineBorder,
                                        focusedErrorBorder: singleOutlineBorder,
                                        suffixIcon: const Icon(
                                          Icons.calendar_today,
                                        ),
                                      ),
                                      onTap: () async {
                                        DateTime? date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            builder: (context, child) => Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary:
                                                          Color(0xffffbd66),
                                                      onPrimary:
                                                          Color(0xff364f6c),
                                                      onSurface:
                                                          Color(0xff364f6c),
                                                    ),
                                                    dialogBackgroundColor:
                                                        Colors.white,
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                              primary: Color(
                                                                  0xff364f6c)),
                                                    ),
                                                  ),
                                                  child: child!,
                                                ));

                                        dateCtlStart.text = date!
                                            .toIso8601String()
                                            .split("T")[0];
                                      },
                                    ),
                                  ),
                                ),
                                rowItemSpace(),
                                Expanded(
                                  child: Container(
                                    decoration: singleContainerDecoration,
                                    child: TextFormField(
                                      onSaved: (newValue) {
                                        ref.read(PostShareProvider).setTime(newValue);
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "    Lütfen tarih\n    seçiniz";
                                        }
                                        return null;
                                      },
                                      controller:
                                          timeInputStart, //editing controller of this TextField
                                      decoration: InputDecoration(
                                          border: singleOutlineBorder,
                                          disabledBorder: singleOutlineBorder,
                                          errorBorder: singleOutlineBorder,
                                          focusedBorder: singleOutlineBorder,
                                          enabledBorder: singleOutlineBorder,
                                          focusedErrorBorder:
                                              singleOutlineBorder,
                                          suffixIcon: const Icon(
                                            Icons.timer,
                                          ), //icon of text field
                                          labelText:
                                              "Başlangıç " //label text of field
                                          ),
                                      readOnly:
                                          true, //set it true, so that user will not able to edit text
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          initialTime: TimeOfDay.now(),
                                          context: context,
                                        );

                                        if (pickedTime != null) {
                                          DateTime parsedTime = DateFormat.jm()
                                              .parse(pickedTime
                                                  .format(context)
                                                  .toString());
                                          String formattedTime =
                                              DateFormat('HH:mm:ss')
                                                  .format(parsedTime);
                                          setState(() {
                                            timeInputStart.text =
                                                formattedTime; //set the value of text field.
                                          });
                                        } else {
                                          // todo Time is not selected
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: singleContainerDecoration,
                                  child: TextFormField(
                                    onSaved: (newValue) {
                                      ref.read(PostShareProvider).setendDate(newValue);
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "    Lütfen tarih\n    seçiniz";
                                      }
                                      return null;
                                    },
                                    controller: dateCtlEnd,
                                    decoration: InputDecoration(
                                      labelText: "Bitiş tarihi",
                                      border: singleOutlineBorder,
                                      disabledBorder: singleOutlineBorder,
                                      errorBorder: singleOutlineBorder,
                                      focusedBorder: singleOutlineBorder,
                                      enabledBorder: singleOutlineBorder,
                                      focusedErrorBorder: singleOutlineBorder,
                                      suffixIcon: const Icon(
                                        Icons.calendar_today,
                                      ),
                                    ),
                                    onTap: () async {
                                      DateTime? date = DateTime(1900);
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());

                                      date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                          builder: (context, child) => Theme(
                                                data:
                                                    Theme.of(context).copyWith(
                                                  colorScheme:
                                                      const ColorScheme.light(
                                                    primary: Color(0xffffbd66),
                                                    onPrimary:
                                                        Color(0xff364f6c),
                                                    onSurface:
                                                        Color(0xff364f6c),
                                                  ),
                                                  dialogBackgroundColor:
                                                      Colors.white,
                                                  textButtonTheme:
                                                      TextButtonThemeData(
                                                    style: TextButton.styleFrom(
                                                        primary:
                                                            Color(0xff364f6c)),
                                                  ),
                                                ),
                                                child: child!,
                                              ));
                                      dateCtlEnd.text =
                                          date!.toIso8601String().split("T")[0];
                                    },
                                  ),
                                ),
                              ),
                              rowItemSpace(),
                              Expanded(
                                child: Container(
                                  decoration: singleContainerDecoration,
                                  child: TextFormField(
                                    onSaved: (newValue) {
                                      ref.read(PostShareProvider).setendTime(newValue);
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "    Lütfen tarih\n    seçiniz";
                                      }
                                      return null;
                                    },
                                    controller:
                                        timeInputEnd, //editing controller of this TextField
                                    decoration: InputDecoration(
                                      labelText: "Bitiş tarihi",
                                      hintText: "Ex. Insert your dob",
                                      border: singleOutlineBorder,
                                      disabledBorder: singleOutlineBorder,
                                      errorBorder: singleOutlineBorder,
                                      focusedBorder: singleOutlineBorder,
                                      enabledBorder: singleOutlineBorder,
                                      focusedErrorBorder: singleOutlineBorder,
                                      suffixIcon: const Icon(
                                        Icons.timer,
                                      ),
                                    ),
                                    readOnly:
                                        true, //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        initialTime: TimeOfDay.now(),
                                        context: context,
                                      );

                                      if (pickedTime != null) {
                                        DateTime parsedTime = DateFormat.jm()
                                            .parse(pickedTime
                                                .format(context)
                                                .toString());

                                        String formattedTime =
                                            DateFormat('HH:mm:ss')
                                                .format(parsedTime);

                                        setState(() {
                                          timeInputEnd.text =
                                              formattedTime; //set the value of text field.
                                        });
                                      } else {
                                        // todo  Time is not selected
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text('Online'),
                                  value: SingingCharacter.online,
                                  groupValue: _isOnlineController,
                                  onChanged: (value) {
                                    setState(() {
                                      _isOnlineController = value!;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text('Yüz yüze'),
                                  value: SingingCharacter.platform,
                                  groupValue: _isOnlineController,
                                  onChanged: (value) {
                                    setState(() {
                                      _isOnlineController = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: singleContainerDecoration,
                              child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return _isOnlineController ==
                                              SingingCharacter.online
                                          ? "Lütfen platform link'i giriniz!"
                                          : 'Lütfen mekan adi giriniz!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: _isOnlineController ==
                                            SingingCharacter.online
                                        ? "Platform Link'i"
                                        : 'Mekan Adi',
                                    border: singleOutlineBorder,
                                    disabledBorder: singleOutlineBorder,
                                    errorBorder: singleOutlineBorder,
                                    focusedBorder: singleOutlineBorder,
                                    enabledBorder: singleOutlineBorder,
                                    focusedErrorBorder: singleOutlineBorder,
                                  ),
                                  onSaved: (val) {
                                    _isOnlineController ==
                                            SingingCharacter.online
                                        ? ref.read(PostShareProvider)
                                            .setPlatformLink(val.toString())
                                        : ref.read(PostShareProvider).setEventPlaceLocationTitle(
                                            val.toString());
                                  }),
                            ),
                          ),
                          Visibility(
                            visible:
                                _isOnlineController != SingingCharacter.online,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                decoration: singleContainerDecoration,
                                child: TextFormField(
                                    validator: (val) {
                                      if (_isOnlineController !=
                                          SingingCharacter.online) {
                                        if (val!.isEmpty) {
                                          return "Lütfen lokasyon giriniz!";
                                        }
                                        return null;
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      labelText: 'Lokasyonu giriniz !',
                                      border: singleOutlineBorder,
                                      disabledBorder: singleOutlineBorder,
                                      errorBorder: singleOutlineBorder,
                                      focusedBorder: singleOutlineBorder,
                                      enabledBorder: singleOutlineBorder,
                                      focusedErrorBorder: singleOutlineBorder,
                                    ),
                                    onSaved: (val) {
                                      if (_isOnlineController !=
                                          SingingCharacter.online) {
                                        ref.read(PostShareProvider).setLocation(val.toString());
                                      }
                                    }),
                              ),
                            ),
                          ),
                          EventPageComponent(
                              postKey: widget.postKey,
                              title: "Etkinlik Fotoğrafları",
                              indexs: const [1, 2, 3]),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Container(
                              decoration: singleContainerDecoration,
                              child: TextFormField(
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: 'Etkinlik açıklaması',
                                    border: singleOutlineBorder,
                                    disabledBorder: singleOutlineBorder,
                                    errorBorder: singleOutlineBorder,
                                    focusedBorder: singleOutlineBorder,
                                    enabledBorder: singleOutlineBorder,
                                    focusedErrorBorder: singleOutlineBorder,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 50.0, horizontal: 10.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '        Lütfen etkinlik açıklaması giriniz !';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    ref.read(PostShareProvider).setDescription(val.toString());
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Container(
                              decoration: singleContainerDecoration,
                              child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    labelText: 'Etkinlik site linki',
                                    border: singleOutlineBorder,
                                    disabledBorder: singleOutlineBorder,
                                    errorBorder: singleOutlineBorder,
                                    focusedBorder: singleOutlineBorder,
                                    enabledBorder: singleOutlineBorder,
                                    focusedErrorBorder: singleOutlineBorder,
                                  ),
                                  onSaved: (val) {
                                    if (val!.isNotEmpty) {
                                      ref.read(PostShareProvider)
                                          .setEventWebSiteUrl(val.toString());
                                    }
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
                                      ref.read(PostShareProvider).setIsCertificated(
                                          newValue == 'VAR' ? true : false);
                                    },
                                    value: "YOK",
                                    decoration: InputDecoration(
                                      labelText: "Sertifika",
                                      border: singleOutlineBorder,
                                      disabledBorder: singleOutlineBorder,
                                      errorBorder: singleOutlineBorder,
                                      focusedBorder: singleOutlineBorder,
                                      enabledBorder: singleOutlineBorder,
                                      focusedErrorBorder: singleOutlineBorder,
                                    ),
                                    items: <String>['VAR', 'YOK']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {
                                      // TODO Sertifika var veya yok
                                    },
                                  ),
                                ),
                              ),
                              rowItemSpace(),
                              Expanded(
                                child: Container(
                                  decoration: singleContainerDecoration,
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "    Lütfen bilet sayısı \n    giriniz!";
                                        } else {
                                          try {
                                            final val = int.parse(value);
                                            if (val > 250) {
                                              return "    Bilet sayısı 250'den \n   büyük olamaz!";
                                            } else if (val < 1) {
                                              return "    Bilet sayısı 1'den \n   küçük olamaz!";
                                            }
                                          } catch (e) {
                                            return "    Lütfen geçerli bir sayı \n    giriniz!";
                                          }
                                        }

                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Bilet sayısı',
                                        border: singleOutlineBorder,
                                        disabledBorder: singleOutlineBorder,
                                        errorBorder: singleOutlineBorder,
                                        focusedBorder: singleOutlineBorder,
                                        enabledBorder: singleOutlineBorder,
                                        focusedErrorBorder: singleOutlineBorder,
                                      ),
                                      onSaved: (val) {
                                        ref.read(PostShareProvider)
                                            .setTicketNumber(int.parse(val!));
                                      }),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text('Ücretsiz Bilet'),
                                  value: SingingCharacter.free,
                                  groupValue: _character3,
                                  onChanged: (value) {
                                    setState(() {
                                      _character3 = value!;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<SingingCharacter>(
                                  title: const Text('Ücretli Bilet'),
                                  value: SingingCharacter.paid,
                                  groupValue: _character3,
                                  onChanged: (value) {
                                    setState(() {
                                      _character3 = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: singleContainerDecoration,
                                    child: DropdownButtonFormField<String>(
                                      value: "Gerekmiyor",
                                      decoration: InputDecoration(
                                        labelText: "CV",
                                        border: singleOutlineBorder,
                                        disabledBorder: singleOutlineBorder,
                                        errorBorder: singleOutlineBorder,
                                        focusedBorder: singleOutlineBorder,
                                        enabledBorder: singleOutlineBorder,
                                        focusedErrorBorder: singleOutlineBorder,
                                      ),
                                      items: <String>['Gerekiyor', 'Gerekmiyor']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                      onSaved: (val) {
                                        ref.read(PostShareProvider).setIsNeedCV(
                                            val == "Gerekmiyor" ? false : true);
                                      },
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _character3 == SingingCharacter.paid,
                                  child: rowItemSpace(),
                                ),
                                Visibility(
                                  visible: _character3 == SingingCharacter.paid,
                                  child: Expanded(
                                    child: Container(
                                      decoration: singleContainerDecoration,
                                      child: DropdownButtonFormField<String>(
                                          value: "Ücretsiz",
                                          onSaved: (newValue) {
                                            late final int price;
                                            switch (newValue) {
                                              case "Ücretsiz":
                                                price = 0;
                                                break;
                                              case "50 TL":
                                                price = 50;
                                                break;
                                              case "100 TL":
                                                price = 100;
                                                break;
                                              case "150 TL":
                                                price = 150;
                                                break;
                                            }
                                            ref.read(PostShareProvider).setPrice(price);
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Bilet Ucreti",
                                            border: singleOutlineBorder,
                                            disabledBorder: singleOutlineBorder,
                                            errorBorder: singleOutlineBorder,
                                            focusedBorder: singleOutlineBorder,
                                            enabledBorder: singleOutlineBorder,
                                            focusedErrorBorder:
                                                singleOutlineBorder,
                                          ),
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          items: <String>[
                                            'Ücretsiz',
                                            '50 TL',
                                            '100 TL',
                                            '150 TL'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (_) {}),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          EventPageComponent(
                              postKey: widget.postKey,
                              title: "Afiş Fotoğrafları",
                              indexs: const [4, 5, 6]),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: singleContainerDecoration,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      autofocus: false,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                        helperText:
                                            "   Boşluk bırakmadan\n   virgül ile ayırın",
                                        labelText: 'Sponsorlar',
                                        border: singleOutlineBorder,
                                        disabledBorder: singleOutlineBorder,
                                        errorBorder: singleOutlineBorder,
                                        focusedBorder: singleOutlineBorder,
                                        enabledBorder: singleOutlineBorder,
                                        focusedErrorBorder: singleOutlineBorder,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 50.0,
                                                horizontal: 20.0),
                                      ),
                                      onSaved: (val) {
                                        if (val!.isNotEmpty) {
                                          List<String> _sponsor =
                                              val.split(",");
                                          for (var element in _sponsor) {
                                            if (element == "") {
                                              _sponsor.remove(element);
                                            } else if (element == " ") {
                                              _sponsor.remove(element);
                                            }
                                          }
                                          ref.read(PostShareProvider).setSponsors(_sponsor);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: singleContainerDecoration,
                                    child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        autofocus: false,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          labelText: 'Koordinatörler',
                                          helperText:
                                              "   Boşluk bırakmadan\n   virgül ile ayırın",
                                          border: singleOutlineBorder,
                                          disabledBorder: singleOutlineBorder,
                                          errorBorder: singleOutlineBorder,
                                          focusedBorder: singleOutlineBorder,
                                          enabledBorder: singleOutlineBorder,
                                          focusedErrorBorder:
                                              singleOutlineBorder,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 50.0,
                                                  horizontal: 20.0),
                                        ),
                                        onSaved: (val) {
                                          if (val!.isNotEmpty) {
                                            List<String> _coordinators =
                                                val.split(",");
                                            for (var element in _coordinators) {
                                              if (element == "") {
                                                _coordinators.remove(element);
                                              }
                                            }
                                            ref.read(PostShareProvider)
                                                .setCoordinators(_coordinators);
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              BaseColorPalet.viewButtonColor),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              BaseColorPalet.buttonColor),
                                    ),
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form!.validate()) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              final Widget svg = SvgPicture.asset(
                                                  "assets/images/Component 18.svg",
                                                  semanticsLabel:
                                                      'Uyarı Logosu');
                                              return AlertDialog(
                                                  title: Column(
                                                children: [
                                                  svg,
                                                  const Text(
                                                      'Yakinda sizlerle olacak',
                                                      style: TextStyle(
                                                        fontFamily: 'PTSans',
                                                        fontSize: 18,
                                                      ))
                                                ],
                                              ));
                                            });
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              final Widget svg = SvgPicture.asset(
                                                  "assets/images/Component 19.svg",
                                                  semanticsLabel:
                                                      'Uyarı Logosu');
                                              return AlertDialog(
                                                  title: Column(
                                                children: [
                                                  svg,
                                                  const Text(
                                                      'Lütfen eksik bilgileri doldurunuz',
                                                      style: TextStyle(
                                                          fontFamily: 'PTSans',
                                                          fontSize: 18,
                                                          color:
                                                              Colors.black38))
                                                ],
                                              ));
                                            });
                                      }
                                    },
                                    child: const Text('Önizle')),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              BaseColorPalet.buttonColor),
                                    ),
                                    onPressed: () async {
                                      final form = _formKey.currentState;
                                      if (form!.validate()) {
                                        form.save();
                                        ref.read(PostShareProvider).setIsPrivate(
                                            _privateController ==
                                                    SingingCharacter.publicEvent
                                                ? false
                                                : true);
                                        ref.read(PostShareProvider).setIsOnline(
                                            _isOnlineController ==
                                                    SingingCharacter.online
                                                ? true
                                                : false);
                                        await Future.delayed(
                                            const Duration(seconds: 1));
                                        final bool _result =
                                            await ref.read(PostShareProvider).addPost(
                                                context,
                                                widget.postKey,
                                                widget.postIsSharingProvider,
                                                widget.postKey);
                                        Navigator.of(context).pop(_result);
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              final Widget svg = SvgPicture.asset(
                                                  "assets/images/Component 19.svg",
                                                  semanticsLabel:
                                                      'Uyarı Logosu');
                                              return AlertDialog(
                                                  title: Column(
                                                children: [
                                                  svg,
                                                  const Text(
                                                      'Lütfen eksik bilgileri doldurunuz',
                                                      style: TextStyle(
                                                          fontFamily: 'PTSans',
                                                          fontSize: 18,
                                                          color:
                                                              Colors.black38))
                                                ],
                                              ));
                                            });
                                      }
                                    },
                                    child: const Text('Kaydet')),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )));
          },
        ));
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //  super.debugFillProperties(properties);
  // properties.add(EnumProperty<SingingCharacter>('_character2', _character2));
  //}
// todo radiobuttonları doldurma işlevi post_model.dart'a göre çoğaltacağız
}
