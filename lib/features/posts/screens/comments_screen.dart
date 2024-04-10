import 'package:devnet2/core/common/error_text.dart';
import 'package:devnet2/core/common/loader.dart';
import 'package:devnet2/core/common/post_card.dart';
import 'package:devnet2/features/authentication/controller/authentication_controller.dart';
import 'package:devnet2/features/posts/comment_card.dart';
import 'package:devnet2/features/posts/controller/post_controller.dart';
import 'package:devnet2/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsScreen extends ConsumerStatefulWidget {
  final String postId;
  const CommentsScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentsScreenState();
}

//text controller
class _CommentsScreenState extends ConsumerState<CommentsScreen> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

//Adding comments
  void addComment(Post post) {
    ref.read(postControllerProvider.notifier).addComment(
          context: context,
          text: commentController.text.trim(),
          post: post,
        );
    setState(() {
      commentController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
//takes the postID and uses the getPostByIdProvider to get the post data
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(getPostByIdProvider(widget.postId)).when(
            data: (data) {
              return Column(
                children: [
                  PostCard(post: data),
                  //Check user type for comment box
                  if (!isGuest)
                    TextField(
                      onSubmitted: (val) => addComment(data),
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: 'Share your thoughts...',
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),

                  ref.watch(getPostCommentsProvider(widget.postId)).when(
                        data: (data) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                final comment = data[index];
                                //fetch post data and render card
                                return CommentCard(comment: comment);
                              },
                            ),
                          );
                        },
                        //handles rrors and loading
                        error: (error, stackTrace) {
                          return ErrorText(
                            error: error.toString(),
                          );
                        },
                        loading: () => const Loader(),
                      ),
                ],
              );
            },
            error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
            loading: () => const Loader(),
          ),
    );
  }
}
