import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social/model/post.dart';
import 'package:social/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //uploading post
  Future<String> uploadPost(
    String desc,
    Uint8List file,
    String uid,
    String username,
    String profImg,
  ) async {
    String res = 'Some error occurred';
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToFirebaseStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
          desc: desc,
          uid: uid,
          username: username,
          postId: postId,
          datePub: DateTime.now(),
          postUrl: photoUrl,
          profileImg: profImg,
          likes: []);

      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'Success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
