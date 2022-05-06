import 'dart:convert';

/// commentUid : {"uuid":"paylasan kisinin uuid","commentDsc":"Comment aciklamasi","Star":5,"helpfulCount":1000}

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
    CommentUid? commentUid,}){
    _commentUid = commentUid;
  }

  Comments.fromJson(dynamic json) {
    _commentUid = json['commentUid'] != null ? CommentUid.fromJson(json['commentUid']) : null;
  }
  CommentUid? _commentUid;
  Comments copyWith({  CommentUid? commentUid,
  }) => Comments(  commentUid: commentUid ?? _commentUid,
  );
  CommentUid? get commentUid => _commentUid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_commentUid != null) {
      map['commentUid'] = _commentUid?.toJson();
    }
    return map;
  }

}

/// uuid : "paylasan kisinin uuid"
/// commentDsc : "Comment aciklamasi"
/// Star : 5
/// helpfulCount : 1000

CommentUid commentUidFromJson(String str) => CommentUid.fromJson(json.decode(str));
String commentUidToJson(CommentUid data) => json.encode(data.toJson());
class CommentUid {
  CommentUid({
    String? uuid,
    String? commentDsc,
    int? star,
    int? helpfulCount,}){
    _uuid = uuid;
    _commentDsc = commentDsc;
    _star = star;
    _helpfulCount = helpfulCount;
  }

  CommentUid.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _commentDsc = json['commentDsc'];
    _star = json['Star'];
    _helpfulCount = json['helpfulCount'];
  }
  String? _uuid;
  String? _commentDsc;
  int? _star;
  int? _helpfulCount;
  CommentUid copyWith({  String? uuid,
    String? commentDsc,
    int? star,
    int? helpfulCount,
  }) => CommentUid(  uuid: uuid ?? _uuid,
    commentDsc: commentDsc ?? _commentDsc,
    star: star ?? _star,
    helpfulCount: helpfulCount ?? _helpfulCount,
  );
  String? get uuid => _uuid;
  String? get commentDsc => _commentDsc;
  int? get star => _star;
  int? get helpfulCount => _helpfulCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['commentDsc'] = _commentDsc;
    map['Star'] = _star;
    map['helpfulCount'] = _helpfulCount;
    return map;
  }

}