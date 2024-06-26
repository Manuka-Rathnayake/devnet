import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String title;
  final String? description;
  final String communityName;
  final String communityProfilePic;
  final List<String> like;
  final List<String> dislike;
  final int commentCount;
  final String username;
  final String uid;
  final String type;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    this.description,
    required this.communityName,
    required this.communityProfilePic,
    required this.like,
    required this.dislike,
    required this.commentCount,
    required this.username,
    required this.uid,
    required this.type,
    required this.createdAt,
  });

  Post copyWith({
    String? id,
    String? title,
    String? link,
    String? description,
    String? communityName,
    String? communityProfilePic,
    List<String>? upvotes,
    List<String>? downvotes,
    int? commentCount,
    String? username,
    String? uid,
    String? type,
    DateTime? createdAt,
    List<String>? awards,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      communityName: communityName ?? this.communityName,
      communityProfilePic: communityProfilePic ?? this.communityProfilePic,
      like: upvotes ?? this.like,
      dislike: downvotes ?? this.dislike,
      commentCount: commentCount ?? this.commentCount,
      username: username ?? this.username,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'communityName': communityName,
      'communityProfilePic': communityProfilePic,
      'like': like,
      'dislike': dislike,
      'commentCount': commentCount,
      'username': username,
      'uid': uid,
      'type': type,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'],
      communityName: map['communityName'] ?? '',
      communityProfilePic: map['communityProfilePic'] ?? '',
      like: List<String>.from(map['like']),
      dislike: List<String>.from(map['dislike']),
      commentCount: map['commentCount']?.toInt() ?? 0,
      username: map['username'] ?? '',
      uid: map['uid'] ?? '',
      type: map['type'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'Post(id: $id, title: $title, description: $description, communityName: $communityName, communityProfilePic: $communityProfilePic, like: $like, dislike: $dislike, commentCount: $commentCount, username: $username, uid: $uid, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.communityName == communityName &&
        other.communityProfilePic == communityProfilePic &&
        listEquals(other.like, like) &&
        listEquals(other.dislike, dislike) &&
        other.commentCount == commentCount &&
        other.username == username &&
        other.uid == uid &&
        other.type == type &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        communityName.hashCode ^
        communityProfilePic.hashCode ^
        like.hashCode ^
        dislike.hashCode ^
        commentCount.hashCode ^
        username.hashCode ^
        uid.hashCode ^
        type.hashCode ^
        createdAt.hashCode;
  }
}
