
import 'dart:convert';

import 'CommentUidModel.dart';

/// commentUid : {"uuid":"paylasan kisinin uuid","commentDsc":"Comment aciklamasi","Star":5,"isHelpful":false,"helpfulCount":1000}

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

