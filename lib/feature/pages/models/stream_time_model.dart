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
    String? full,
  }) {
    _date = date;
    _time = time;
    _full = full;
  }

  StreamTime.fromJson(dynamic json) {
    _date = json['date'];
    _full = json['full'];
    _time = json['time'];
  }
  String? _date;
  String? _full;
  String? _time;
  StreamTime copyWith({
    String? date,
    String? full,
    String? time,
  }) =>
      StreamTime(
        date: date ?? _date,
        full: full ?? _full,
        time: time ?? _time,
      );
  String? get date => _date;
  String? get full => _full;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['full'] = _full;
    map['time'] = _time;
    return map;
  }
}
