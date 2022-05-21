import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum SingingCharacter { lafayette, jefferson, ozel, herkese, free, paid }

class PostSharePage extends StatefulWidget {
  const PostSharePage({Key? key}) : super(key: key);

  @override
  _PostSharePageState createState() => _PostSharePageState();
}

class _PostSharePageState extends State<PostSharePage> {
  final _formKey = GlobalKey<FormState>();
  //final _post = Post();
  // todo post_model.dart ile birleştikten sonra form alma işlemi
  TextEditingController dateCtl = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  @override
  void dispose() {
    timeInput.dispose();
    dateCtl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    timeInput.text = ""; //set the initial value of text field
    super.initState();
  }

  SingingCharacter _character = SingingCharacter.lafayette;
  SingingCharacter _character2 = SingingCharacter.ozel;
  SingingCharacter _character3 = SingingCharacter.free;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: SingleChildScrollView(
          child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Etkinlik Başlığı',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Lütfen etkinlik ismi giriniz';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  // TODO Etkinlik Başlığı
                                }),
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Etkinlik kategorisi',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Lütfen kategori seçiniz.';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  // TODO Etkinlik kategorisi
                                }),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: RadioListTile<SingingCharacter>(
                                        title: const Text('Özel Etkinlik'),
                                        value: SingingCharacter.jefferson,
                                        groupValue: _character,
                                        onChanged: (value) {
                                          setState(() {
                                            _character = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: RadioListTile<SingingCharacter>(
                                        title: const Text('Herkese Açık'),
                                        value: SingingCharacter.lafayette,
                                        groupValue: _character,
                                        onChanged: (value) {
                                          setState(() {
                                            _character = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextFormField(
                                        controller: dateCtl,
                                        decoration: const InputDecoration(
                                          labelText: "Başlangıç tarihi",
                                          hintText: "Ex. Insert your dob",
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(
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
                                              lastDate: DateTime(2100));

                                          dateCtl.text =
                                              date!.toIso8601String();
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextField(
                                        controller:
                                            timeInput, //editing controller of this TextField
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            suffixIcon: Icon(
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
                                            DateTime parsedTime =
                                                DateFormat.jm().parse(pickedTime
                                                    .format(context)
                                                    .toString());
                                            String formattedTime =
                                                DateFormat('HH:mm:ss')
                                                    .format(parsedTime);
                                            setState(() {
                                              timeInput.text =
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
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: TextFormField(
                                      controller: dateCtl,
                                      decoration: const InputDecoration(
                                        labelText: "Bitiş tarihi",
                                        hintText: "Ex. Insert your dob",
                                        border: OutlineInputBorder(),
                                        suffixIcon: Icon(
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
                                            lastDate: DateTime(2100));

                                        dateCtl.text = date!.toIso8601String();
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: TextField(
                                          controller:
                                              timeInput, //editing controller of this TextField
                                          decoration: const InputDecoration(
                                            labelText: "Bitiş tarihi",
                                            hintText: "Ex. Insert your dob",
                                            border: OutlineInputBorder(),
                                            suffixIcon: Icon(
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
                                              DateTime parsedTime =
                                                  DateFormat.jm().parse(
                                                      pickedTime
                                                          .format(context)
                                                          .toString());

                                              String formattedTime =
                                                  DateFormat('HH:mm:ss')
                                                      .format(parsedTime);

                                              setState(() {
                                                timeInput.text =
                                                    formattedTime; //set the value of text field.
                                              });
                                            } else {
                                              // todo  Time is not selected
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: RadioListTile<SingingCharacter>(
                                        title: const Text('Online'),
                                        value: SingingCharacter.ozel,
                                        groupValue: _character2,
                                        onChanged: (value) {
                                          setState(() {
                                            _character2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: RadioListTile<SingingCharacter>(
                                        title: const Text('Yüz yüze'),
                                        value: SingingCharacter.herkese,
                                        groupValue: _character2,
                                        onChanged: (value) {
                                          setState(() {
                                            _character2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Mekan Adı ',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (val) {
                                    // TODO Mekan Adı
                                  }),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    labelText: 'Lokasyonu giriniz !',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (val) {
                                    // TODO Lokasyon bilgisi
                                  }),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 100,
                                        fallbackWidth: 100,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 100,
                                        fallbackWidth: 100,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 75,
                                        fallbackWidth: 75,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  decoration: const InputDecoration(
                                    labelText: 'Etkinlik açıklaması',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 50.0, horizontal: 10.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Lütfen etkinlik açıklaması giriniz !';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    // TODO Etkinlik açıklama
                                  }),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    labelText: 'Etkinlik site linki',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (val) {
                                    // TODO Etkinlik link
                                  }),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
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
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                        items: <String>['1', '2', '3', '4']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (_) {
                                          // todo Bilet adedi
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
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
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      items: <String>['Gerekiyor', 'Gerekmiyor']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {
                                        // todo CV gerekliliği
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
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
                                        onChanged: (_) {
                                          // todo Bilet ücreti
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 100,
                                        fallbackWidth: 100,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 100,
                                        fallbackWidth: 100,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 75,
                                        fallbackWidth: 75,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          autofocus: false,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            labelText: 'Sponsorlar',
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 50.0,
                                                    horizontal: 20.0),
                                          ),
                                          onSaved: (val) {
                                            // TODO Lokasyon bilgisi
                                          }),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 30,
                                        fallbackWidth: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          autofocus: false,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            labelText: 'Koordinatörler',
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 50.0,
                                                    horizontal: 20.0),
                                          ),
                                          onSaved: (val) {
                                            // TODO Lokasyon bilgisi
                                          }),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Placeholder(
                                        fallbackHeight: 30,
                                        fallbackWidth: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: RaisedButton(
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form!.validate()) {
                                        form.save();
                                        // _post.save();
                                        // todo post_model.dart ile birleştirme yapılacak
                                        // todo önizleme ekranı oluşturulacak
                                        _showDialog(context);
                                      }
                                    },
                                    child: const Text('Önizle'))),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form!.validate()) {
                                        form.save();
                                        //post.save();
                                        // todo post_model.dart ile birleştirme yapılacak
                                        _showDialog(context);
                                      }
                                    },
                                    child: const Text('Kaydet'))),
                          ])))),
        ));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(const SnackBar(content: Text('Submitting form')));
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //  super.debugFillProperties(properties);
  // properties.add(EnumProperty<SingingCharacter>('_character2', _character2));
  //}
// todo radiobuttonları doldurma işlevi post_model.dart'a göre çoğaltacağız
}
