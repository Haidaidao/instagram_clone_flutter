import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublish,
    required this.postUrl,
    required this.proImage,
    required this.likes,
  });

  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublish;
  final String postUrl;
  final String proImage;
  final likes;

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'uid': uid,
      "username": username,
      'postId': postId,
      'datePublish': datePublish,
      'postUrl': postUrl,
      'proImage': proImage,
      'likes': likes
    };
  }

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        description: snapshot['descruption'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        postId: snapshot['postId'],
        datePublish: snapshot['datePublish'],
        postUrl: snapshot['postUrl'],
        proImage: snapshot['proImage'],
        likes: snapshot['likes']);
  }
}
