import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String desc;
  final String uid;
  final String username;
  final String postId;
  final datePub;
  final String postUrl;
  final String profileImg;
  final likes;

  const Post({
    required this.desc,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePub,
    required this.postUrl,
    required this.profileImg,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'desc': desc,
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePub': datePub,
        'postUrl': postUrl,
        'profileImg': profileImg,
        'likes': likes
      };

  static Post fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return Post(
      desc: snap['desc'],
      uid: snap['uid'],
      username: snap['username'],
      postId: snap['postId'],
      datePub: snap['datePub'],
      postUrl: snap['postUrl'],
      profileImg: snap['profileImg'],
      likes: snap['likes']
    );
  }
}
