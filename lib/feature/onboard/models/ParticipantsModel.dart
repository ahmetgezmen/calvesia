
import 'dart:convert';

/// participantuid : "profileImagePath"

Participants participantsFromJson(String str) => Participants.fromJson(json.decode(str));
String participantsToJson(Participants data) => json.encode(data.toJson());
class Participants {
  Participants({
    String? participantuid,}){
    _participantuid = participantuid;
  }

  Participants.fromJson(dynamic json) {
    _participantuid = json['participantuid'];
  }
  String? _participantuid;
  Participants copyWith({  String? participantuid,
  }) => Participants(  participantuid: participantuid ?? _participantuid,
  );
  String? get participantuid => _participantuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['participantuid'] = _participantuid;
    return map;
  }

}