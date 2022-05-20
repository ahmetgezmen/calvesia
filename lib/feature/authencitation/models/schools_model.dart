
import 'dart:convert';

/// name : "name uni"
/// faculty : "Med"
/// classNumber : 3

Schools schoolsFromJson(String str) => Schools.fromJson(json.decode(str));
String schoolsToJson(Schools data) => json.encode(data.toJson());
class Schools {
  Schools({
    String? name,
    String? faculty,
    int? classNumber,}){
    _name = name;
    _faculty = faculty;
    _classNumber = classNumber;
  }

  Schools.fromJson(dynamic json) {
    _name = json['name'];
    _faculty = json['faculty'];
    _classNumber = json['classNumber'];
  }
  String? _name;
  String? _faculty;
  int? _classNumber;
  Schools copyWith({  String? name,
    String? faculty,
    int? classNumber,
  }) => Schools(  name: name ?? _name,
    faculty: faculty ?? _faculty,
    classNumber: classNumber ?? _classNumber,
  );
  String? get name => _name;
  String? get faculty => _faculty;
  int? get classNumber => _classNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['faculty'] = _faculty;
    map['classNumber'] = _classNumber;
    return map;
  }

}
