import 'dart:convert';
/// sponsors : ["sponsorsUid"]

Sponsors sponsorsFromJson(String str) => Sponsors.fromJson(json.decode(str));
String sponsorsToJson(Sponsors data) => json.encode(data.toJson());
class Sponsors {
  Sponsors({
    List<String>? sponsors,}){
    _sponsors = sponsors;
  }

  Sponsors.fromJson(dynamic json) {
    _sponsors = json['sponsors'] != null ? json['sponsors'].cast<String>() : [];
  }
  List<String>? _sponsors;
  Sponsors copyWith({  List<String>? sponsors,
  }) => Sponsors(  sponsors: sponsors ?? _sponsors,
  );
  List<String>? get sponsors => _sponsors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sponsors'] = _sponsors;
    return map;
  }

}