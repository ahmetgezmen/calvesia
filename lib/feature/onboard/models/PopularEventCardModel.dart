import 'dart:convert';
/// image : "ImagePath"
/// title : "Example Title"
/// date : "Event Date"
/// location : "Location Adress"
/// time : "Event Time"
/// ticketBuyers : "List of Ticket Buyers"
/// isFaved : false

PopularEventCardModel popularEventCardModelFromJson(String str) => PopularEventCardModel.fromJson(json.decode(str));
String popularEventCardModelToJson(PopularEventCardModel data) => json.encode(data.toJson());
class PopularEventCardModel {
  PopularEventCardModel({
      String? image, 
      String? title, 
      String? date, 
      bool? isFaved,
      String? location,
      String? time, 
      String? ticketBuyers,}){
    _image = image;
    _isFaved = isFaved;
    _title = title;
    _date = date;
    _location = location;
    _time = time;
    _ticketBuyers = ticketBuyers;
}

  PopularEventCardModel.fromJson(dynamic json) {
    _image = json['image'];
    _isFaved = json['isFaved'];
    _title = json['title'];
    _date = json['date'];
    _location = json['location'];
    _time = json['time'];
    _ticketBuyers = json['ticketBuyers'];
  }
  String? _image;
  bool? _isFaved;
  String? _title;
  String? _date;
  String? _location;
  String? _time;
  String? _ticketBuyers;
PopularEventCardModel copyWith({  String? image,
  String? title,
  bool? isFaved,
  String? date,
  String? location,
  String? time,
  String? ticketBuyers,
}) => PopularEventCardModel(  image: image ?? _image,
  title: title ?? _title,
  isFaved: isFaved ?? _isFaved,
  date: date ?? _date,
  location: location ?? _location,
  time: time ?? _time,
  ticketBuyers: ticketBuyers ?? _ticketBuyers,
);
  String? get image => _image;
  String? get title => _title;
  bool? get isFaved => _isFaved;
  String? get date => _date;
  String? get location => _location;
  String? get time => _time;
  String? get ticketBuyers => _ticketBuyers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title;
    map['isFaved'] = _isFaved;
    map['date'] = _date;
    map['location'] = _location;
    map['time'] = _time;
    map['ticketBuyers'] = _ticketBuyers;
    return map;
  }

}