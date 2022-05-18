

import 'dart:convert';

Participants participantsFromJson(String str) => Participants.fromJson(json.decode(str));
String participantsToJson(Participants data) => json.encode(data.toJson());
class Participants {
  Participants({
    String? participantUid,}){
    _participantUid = participantUid;
  }

  Participants.fromJson(dynamic json) {
    _participantUid = json['participantUid'];
  }
  String? _participantUid;
  Participants copyWith({  String? participantUid,
  }) => Participants(  participantUid: participantUid ?? _participantUid,
  );
  String? get participantUid => _participantUid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['participantUid'] = _participantUid;
    return map;
  }

}