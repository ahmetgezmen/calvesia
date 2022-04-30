import 'dart:convert';
/// image : "ImagePath"
/// title : "Example Title"
/// foloversNumber : 100
/// location : "Event Location"
/// ticketBuyers : "List of Ticket Buyer"
/// showingNumber : 1000
/// isFaved : false

UpcomingEventsCardModel upcomingEventsCardModelFromJson(String str) => UpcomingEventsCardModel.fromJson(json.decode(str));
String upcomingEventsCardModelToJson(UpcomingEventsCardModel data) => json.encode(data.toJson());
class UpcomingEventsCardModel {
  UpcomingEventsCardModel({
      String? image, 
      String? title, 
      int? foloversNumber, 
      String? location, 
      String? ticketBuyers, 
      int? showingNumber, 
      bool? isFaved,}){
    _image = image;
    _title = title;
    _foloversNumber = foloversNumber;
    _location = location;
    _ticketBuyers = ticketBuyers;
    _showingNumber = showingNumber;
    _isFaved = isFaved;
}

  UpcomingEventsCardModel.fromJson(dynamic json) {
    _image = json['image'];
    _title = json['title'];
    _foloversNumber = json['foloversNumber'];
    _location = json['location'];
    _ticketBuyers = json['ticketBuyers'];
    _showingNumber = json['showingNumber'];
    _isFaved = json['isFaved'];
  }
  String? _image;
  String? _title;
  int? _foloversNumber;
  String? _location;
  String? _ticketBuyers;
  int? _showingNumber;
  bool? _isFaved;
UpcomingEventsCardModel copyWith({  String? image,
  String? title,
  int? foloversNumber,
  String? location,
  String? ticketBuyers,
  int? showingNumber,
  bool? isFaved,
}) => UpcomingEventsCardModel(  image: image ?? _image,
  title: title ?? _title,
  foloversNumber: foloversNumber ?? _foloversNumber,
  location: location ?? _location,
  ticketBuyers: ticketBuyers ?? _ticketBuyers,
  showingNumber: showingNumber ?? _showingNumber,
  isFaved: isFaved ?? _isFaved,
);
  String? get image => _image;
  String? get title => _title;
  int? get foloversNumber => _foloversNumber;
  String? get location => _location;
  String? get ticketBuyers => _ticketBuyers;
  int? get showingNumber => _showingNumber;
  bool? get isFaved => _isFaved;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title;
    map['foloversNumber'] = _foloversNumber;
    map['location'] = _location;
    map['ticketBuyers'] = _ticketBuyers;
    map['showingNumber'] = _showingNumber;
    map['isFaved'] = _isFaved;
    return map;
  }

}