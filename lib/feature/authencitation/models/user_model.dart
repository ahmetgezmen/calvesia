import 'dart:convert';

import 'dob_model.dart';
import 'location_model.dart';
import 'registered_model.dart';
import 'schools_model.dart';
/// isAktive : true
/// isApproved : true
/// gender : "male"
/// fname : "Mark Spector"
/// location : {"street":"9278 new road","city":"kilcoole","state":"waterford","postcode":"93027"}
/// email : "brad.gibson@example.com"
/// uuid : "155e77ee-ba6d-486f-95ce-0e0c0fb4b919"
/// username : "silverswan131"
/// password : "firewall"
/// dob : {"date":"1993-07-20T09:44:18.674Z","age":26}
/// registered : {"date":"2002-05-21T10:59:49.966Z","age":17}
/// schools : {"name":"name uni","faculty":"Med","classNumber":3}
/// phone : "011-962-7516"

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));
String userToJson(UserModel data) => json.encode(data.toJson());
class UserModel{
  UserModel({
      bool? isAktive, 
      bool? isApproved, 
      String? gender,
    String? profileImage,
    Set? favList,
    Set? postUidList,
      String? fname,
      Location? location, 
      String? email, 
      String? uuid, 
      String? username, 
      String? password, 
      Dob? dob, 
      Registered? registered,
      Schools? schools, 
      String? phone,}){
    _isAktive = isAktive;
    _isApproved = isApproved;
    _gender = gender;
    _fname = fname;
    _profileImage = profileImage;
    _favList = favList;
    _postUidList = postUidList;
    _location = location;
    _email = email;
    _uuid = uuid;
    _username = username;
    _password = password;
    _dob = dob;
    _registered = registered;
    _schools = schools;
    _phone = phone;
}

  UserModel.fromJson(dynamic json) {
    _isAktive = json['isAktive'];
    _isApproved = json['isApproved'];
    _gender = json['gender'];
    _profileImage = json['profileImage'];
    _fname = json['fname'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _email = json['email'];
    _uuid = json['uuid'];
    _favList = json['favList'];
    _postUidList = json['postUidList'];
    _username = json['username'];
    _password = json['password'];
    _dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;
    _registered = json['registered'] != null ? Registered.fromJson(json['registered']) : null;
    _schools = json['schools'] != null ? Schools.fromJson(json['schools']) : null;
    _phone = json['phone'];
  }
  bool? _isAktive;
  bool? _isApproved;
  String? _gender;
  String? _profileImage;
  String? _fname;
  Set? _favList;
  Set? _postUidList;
  Location? _location;
  String? _email;
  String? _uuid;
  String? _username;
  String? _password;
  Dob? _dob;
  Registered? _registered;
  Schools? _schools;
  String? _phone;
UserModel copyWith({
  bool? isAktive,
  bool? isApproved,
  String? gender,
  String? profileImage,
  String? fname,
  Set? favList,
  Set? postUidList,
  Location? location,
  String? email,
  String? uuid,
  String? username,
  String? password,
  Dob? dob,
  Registered? registered,
  Schools? schools,
  String? phone,
}) => UserModel(  isAktive: isAktive ?? _isAktive,
  isApproved: isApproved ?? _isApproved,
  gender: gender ?? _gender,
  profileImage: profileImage ?? _profileImage,
  fname: fname ?? _fname,
  favList : favList ?? _favList,
  postUidList : postUidList ?? _postUidList,
  location: location ?? _location,
  email: email ?? _email,
  uuid: uuid ?? _uuid,
  username: username ?? _username,
  password: password ?? _password,
  dob: dob ?? _dob,
  registered: registered ?? _registered,
  schools: schools ?? _schools,
  phone: phone ?? _phone,
);
  bool? get isAktive => _isAktive;
  bool? get isApproved => _isApproved;
  String? get gender => _gender;
  String? get profileImage => _profileImage;
  Set? get favList => _favList;
  Set? get postUidList => _postUidList;
  String? get fname => _fname;
  Location? get location => _location;
  String? get email => _email;
  String? get uuid => _uuid;
  String? get username => _username;
  String? get password => _password;
  Dob? get dob => _dob;
  Registered? get registered => _registered;
  Schools? get schools => _schools;
  String? get phone => _phone;

  void setUserName(val){
    _username = val;
  }
  void setFname(val){
    _fname = val;
  }
  void setPhone(val){
    _phone = val;
  }
  void setPassword(val){
    _password = val;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAktive'] = _isAktive;
    map['favList'] = _favList;
    map['postUidList'] = _postUidList;
    map['isApproved'] = _isApproved;
    map['gender'] = _gender;
    map['profileImage'] = _profileImage;
    map['fname'] = _fname;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['email'] = _email;
    map['uuid'] = _uuid;
    map['username'] = _username;
    map['password'] = _password;
    if (_dob != null) {
      map['dob'] = _dob?.toJson();
    }
    if (_registered != null) {
      map['registered'] = _registered?.toJson();
    }
    if (_schools != null) {
      map['schools'] = _schools?.toJson();
    }
    map['phone'] = _phone;
    return map;
  }

}



