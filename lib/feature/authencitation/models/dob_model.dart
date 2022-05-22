
import 'dart:convert';

/// date : "1993-07-20T09:44:18.674Z"
/// age : 26

Dob dobFromJson(String str) => Dob.fromJson(json.decode(str));
String dobToJson(Dob data) => json.encode(data.toJson());
class Dob {
  Dob({
    String? date,
    int? age,}){
    _date = date;
    _age = age;
  }

  Dob.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }
  String? _date;
  int? _age;
  Dob copyWith({  String? date,
    int? age,
  }) => Dob(  date: date ?? _date,
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
