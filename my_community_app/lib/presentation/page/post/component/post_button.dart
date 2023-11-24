import 'package:flutter/material.dart';
import '../../../../application/usecase/post/post_usecase.dart';
import '../../../../application/usecase/user/state/user_provider.dart';
import '../../../../presentation/page/post/component/post_comment_field.dart';
import '../../../../presentation/page/post/component/post_image.dart';
import '../../../../presentation/presentation_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostButton extends ConsumerWidget with PresentationMixin {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        execute(
          context,
          action: () async {
            final navigator = Navigator.of(context);
            // アプリケーション層の処理呼び出し
            await ref.read(postUsecaseProvider).addPost(
                  image: ref.read(selectedPostImageProvider),
                  comment: ref.read(postCommentControllerProvider).text,
                  user: ref.read(userProvider),
                );
            navigator.pop();
          },
          successMessage: '投稿が完了しました',
        );
      },
      child: const Text('投稿'),
    );
  }
}
