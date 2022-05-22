import 'dart:convert';

/// street : "9278 new road"
/// city : "kilcoole"
/// state : "waterford"
/// postcode : "93027"

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
    String? street,
    String? city,
    String? state,
    String? postcode,}){
    _street = street;
    _city = city;
    _state = state;
    _postcode = postcode;
  }

  Location.fromJson(dynamic json) {
    _street = json['street'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
  }
  String? _street;
  String? _city;
  String? _state;
  String? _postcode;
  Location copyWith({  String? street,
    String? city,
    String? state,
    String? postcode,
  }) => Location(  street: street ?? _street,
    city: city ?? _city,
    state: state ?? _state,
    postcode: postcode ?? _postcode,
  );
  String? get street => _street;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    return map;
  }

}