import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devnet2/core/constants/firebase_constants.dart';
import 'package:devnet2/core/failure.dart';
import 'package:devnet2/core/providers/firebase_providers.dart';
import 'package:devnet2/core/type_defs.dart';
import 'package:devnet2/models/comments_model.dart';
import 'package:devnet2/models/community_model.dart';
import 'package:devnet2/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final postRepositoryProvider = Provider((ref) {
  return PostRepository(
    firestore: ref.watch(firestoreProvider),
  );
});

class PostRepository {
  final FirebaseFirestore _firestore;
  PostRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _posts =>
      _firestore.collection(FirebaseConstants.postsCollection);
  CollectionReference get _comments =>
      _firestore.collection(FirebaseConstants.commentsCollection);
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureVoid addPost(Post post) async {
    try {
      return right(_posts.doc(post.id).set(post.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Post>> fetchUserPosts(List<Community> communities) {
    return _posts
        .where('communityName',
            whereIn: communities.map((e) => e.name).toList())
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Post.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Stream<List<Post>> fetchGuestPosts() {
    return _posts
        .orderBy('createdAt', descending: true)
        .limit(10)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Post.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  FutureVoid deletePost(Post post) async {
    try {
      return right(_posts.doc(post.id).delete());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

// liking and disliking
  void like(Post post, String userId) async {
    if (post.dislike.contains(userId)) {
      _posts.doc(post.id).update({
        'dislike': FieldValue.arrayRemove([userId]),
      });
    }

    if (post.like.contains(userId)) {
      _posts.doc(post.id).update({
        'like': FieldValue.arrayRemove([userId]),
      });
    } else {
      _posts.doc(post.id).update({
        'like': FieldValue.arrayUnion([userId]),
      });
    }
  }

  void dislike(Post post, String userId) async {
    if (post.like.contains(userId)) {
      _posts.doc(post.id).update({
        'like': FieldValue.arrayRemove([userId]),
      });
    }

    if (post.dislike.contains(userId)) {
      _posts.doc(post.id).update({
        'dislike': FieldValue.arrayRemove([userId]),
      });
    } else {
      _posts.doc(post.id).update({
        'dislike': FieldValue.arrayUnion([userId]),
      });
    }
  }

  Stream<Post> getPostById(String postId) {
    return _posts
        .doc(postId)
        .snapshots()
        .map((event) => Post.fromMap(event.data() as Map<String, dynamic>));
  }

//adding comments

  FutureVoid addComment(Comment comment) async {
    try {
      await _comments.doc(comment.id).set(comment.toMap());

      return right(_posts.doc(comment.postId).update({
        'commentCount': FieldValue.increment(1),
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

// showing comments

  Stream<List<Comment>> getCommentsOfPost(String postId) {
    return _comments
        .where('postId', isEqualTo: postId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Comment.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }
}
