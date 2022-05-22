import 'dart:convert';

/// date : "2002-05-21T10:59:49.966Z"
/// age : 17

Registered registeredFromJson(String str) => Registered.fromJson(json.decode(str));
String registeredToJson(Registered data) => json.encode(data.toJson());
class Registered {
  Registered({
    String? date,
    int? age,}){
    _date = date;
    _age = age;
  }

  Registered.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }
  String? _date;
  int? _age;
  Registered copyWith({  String? date,
    int? age,
  }) => Registered(  date: date ?? _date,
    age: age ?? _age,
  );
  String? get date => _date;
  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['age'] = _age;
    return map;
  }

}