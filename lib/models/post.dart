import 'package:cloud_firestore/cloud_firestore.dart';

class Solution {
  final String? mediaUrl;
  final String? problemId;
  final String? thumbnailUrl;

  Solution(this.mediaUrl, this.problemId, this.thumbnailUrl);
  Solution.fromMap(Map<String, dynamic> map)
      : mediaUrl = map['mediaUrl'],
        problemId = map['problemId'],
        thumbnailUrl = map['thumbnailUrl'];
}

class Post {
  final int? clickCount;
  final int? likeCount;
  final String? createdAt;
  final String? updatedAt;
  final String? description;
  final String? id;
  final String? userId;
  final String? problems;
  final List<Solution>? solutions;
  final List<String>? userLikes;

  Post({
    this.clickCount,
    this.likeCount,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.id,
    this.userId,
    this.problems,
    this.solutions,
    this.userLikes,
  });

  Map<String, dynamic> toMap() {
    return {
      'clickCount': clickCount,
      'likeCount': likeCount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'description': description,
      'id': id,
      'userId': userId,
      'problems': problems,
      'solutions': solutions,
      'userLikes': userLikes,
    };
  }

  factory Post.fromMap(
    String docId,
    Map<String, dynamic> map,
    // SnapshotOptions? options,
  ) {
    // final map = snapshot.data();
    return Post(
      clickCount: map?['clickCount'],
      likeCount: map?['likeCount'],
      createdAt: map?['createdAt'],
      description: map?['description'],
      id: map?['id'],
      userId: map?['userId'],
      problems: map?['problems'],
      solutions: List<Solution>.from(map?['solutions'].map((item) {
        return Solution(
            item['mediaUrl'], item['problemId'], item['thumbnailUrl']);
      })),
      userLikes: map?['userLikes'],
    );
  }
}
