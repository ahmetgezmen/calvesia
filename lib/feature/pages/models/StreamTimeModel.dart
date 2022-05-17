import 'dart:convert';

/// date : "streamDate"
/// time : "streamTime"

StreamTime streamTimeFromJson(String str) =>
    StreamTime.fromJson(json.decode(str));
String streamTimeToJson(StreamTime data) => json.encode(data.toJson());

class StreamTime {
  StreamTime({
    String? date,
    String? time,
  }) {
    _date = date;
    _time = time;
  }

  StreamTime.fromJson(dynamic json) {
    _date = json['date'];
    _time = json['time'];
  }
  String? _date;
  String? _time;
  StreamTime copyWith({
    String? date,
    String? time,
  }) =>
      StreamTime(
        date: date ?? _date,
        time: time ?? _time,
      );
  String? get date => _date;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['time'] = _time;
    return map;
  }
}
