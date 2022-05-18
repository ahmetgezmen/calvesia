import 'dart:convert';
/// image : "ImagePath"
/// title : "Example Title"
/// followersNumber : 100
/// location : "Event Location"
/// ticketBuyers : "List of Ticket Buyer"
/// showingNumber : 1000

UpcomingEventsCardModel upcomingEventsCardModelFromJson(String str) => UpcomingEventsCardModel.fromJson(json.decode(str));
String upcomingEventsCardModelToJson(UpcomingEventsCardModel data) => json.encode(data.toJson());
class UpcomingEventsCardModel {
  UpcomingEventsCardModel({
      String? image, 
      String? title, 
      int? followersNumber, 
      String? location, 
      String? ticketBuyers, 
      int? showingNumber, 
  }){
    _image = image;
    _title = title;
    _followersNumber = followersNumber;
    _location = location;
    _ticketBuyers = ticketBuyers;
    _showingNumber = showingNumber;
}

  UpcomingEventsCardModel.fromJson(dynamic json) {
    _image = json['image'];
    _title = json['title'];
    _followersNumber = json['followersNumber'];
    _location = json['location'];
    _ticketBuyers = json['ticketBuyers'];
    _showingNumber = json['showingNumber'];
  }
  String? _image;
  String? _title;
  int? _followersNumber;
  String? _location;
  String? _ticketBuyers;
  int? _showingNumber;
UpcomingEventsCardModel copyWith({  String? image,
  String? title,
  int? followersNumber,
  String? location,
  String? ticketBuyers,
  int? showingNumber,
}) => UpcomingEventsCardModel(  image: image ?? _image,
  title: title ?? _title,
  followersNumber: followersNumber ?? _followersNumber,
  location: location ?? _location,
  ticketBuyers: ticketBuyers ?? _ticketBuyers,
  showingNumber: showingNumber ?? _showingNumber,
);
  String? get image => _image;
  String? get title => _title;
  int? get followersNumber => _followersNumber;
  String? get location => _location;
  String? get ticketBuyers => _ticketBuyers;
  int? get showingNumber => _showingNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title;
    map['followersNumber'] = _followersNumber;
    map['location'] = _location;
    map['ticketBuyers'] = _ticketBuyers;
    map['showingNumber'] = _showingNumber;
    return map;
  }

}