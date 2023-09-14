import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
  });

  final String username;
  final String uid;
  final String photoUrl;
  final String email;
  final String bio;
  final List followers;
  final List following;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'uid': uid,
      "photoUrl": photoUrl,
      'email': email,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot['username'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        email: snapshot['email'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
