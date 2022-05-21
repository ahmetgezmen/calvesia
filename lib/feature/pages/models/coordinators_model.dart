import 'dart:convert';
/// Coordinators : ["uid"]

Coordinators coordinatorsFromJson(String str) => Coordinators.fromJson(json.decode(str));
String coordinatorsToJson(Coordinators data) => json.encode(data.toJson());
class Coordinators {
  Coordinators({
      List<String>? coordinators,}){
    _coordinators = coordinators;
}

  Coordinators.fromJson(dynamic json) {
    _coordinators = json['Coordinators'] != null ? json['Coordinators'].cast<String>() : [];
  }
  List<String>? _coordinators;
Coordinators copyWith({  List<String>? coordinators,
}) => Coordinators(  coordinators: coordinators ?? _coordinators,
);
  List<String>? get coordinators => _coordinators;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Coordinators'] = _coordinators;
    return map;
  }

}