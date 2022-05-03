import 'dart:convert';

/// uuid : "paylasan kisinin uuid"
/// commentDsc : "Comment aciklamasi"
/// Star : 5
/// isHelpful : false
/// helpfulCount : 1000

CommentUid commentUidFromJson(String str) => CommentUid.fromJson(json.decode(str));
String commentUidToJson(CommentUid data) => json.encode(data.toJson());
class CommentUid {
  CommentUid({
    String? uuid,
    String? commentDsc,
    int? star,
    bool? isHelpful,
    int? helpfulCount,}){
    _uuid = uuid;
    _commentDsc = commentDsc;
    _star = star;
    _isHelpful = isHelpful;
    _helpfulCount = helpfulCount;
  }

  CommentUid.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _commentDsc = json['commentDsc'];
    _star = json['Star'];
    _isHelpful = json['isHelpful'];
    _helpfulCount = json['helpfulCount'];
  }
  String? _uuid;
  String? _commentDsc;
  int? _star;
  bool? _isHelpful;
  int? _helpfulCount;
  CommentUid copyWith({  String? uuid,
    String? commentDsc,
    int? star,
    bool? isHelpful,
    int? helpfulCount,
  }) => CommentUid(  uuid: uuid ?? _uuid,
    commentDsc: commentDsc ?? _commentDsc,
    star: star ?? _star,
    isHelpful: isHelpful ?? _isHelpful,
    helpfulCount: helpfulCount ?? _helpfulCount,
  );
  String? get uuid => _uuid;
  String? get commentDsc => _commentDsc;
  int? get star => _star;
  bool? get isHelpful => _isHelpful;
  int? get helpfulCount => _helpfulCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['commentDsc'] = _commentDsc;
    map['Star'] = _star;
    map['isHelpful'] = _isHelpful;
    map['helpfulCount'] = _helpfulCount;
    return map;
  }

}