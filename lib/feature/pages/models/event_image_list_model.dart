import 'dart:convert';
/// eventImageList : ["udi"]

EventImageListModel eventImageListModelFromJson(String str) => EventImageListModel.fromJson(json.decode(str));
String eventImageListModelToJson(EventImageListModel data) => json.encode(data.toJson());
class EventImageListModel {
  EventImageListModel({
      List<String>? eventImageList,}){
    _eventImageList = eventImageList;
}

  EventImageListModel.fromJson(dynamic json) {
    _eventImageList = json['eventImageList'] != null ? json['eventImageList'].cast<String>() : [];
  }
  List<String>? _eventImageList;
EventImageListModel copyWith({  List<String>? eventImageList,
}) => EventImageListModel(  eventImageList: eventImageList ?? _eventImageList,
);
  List<String>? get eventImageList => _eventImageList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['eventImageList'] = _eventImageList;
    return map;
  }

}