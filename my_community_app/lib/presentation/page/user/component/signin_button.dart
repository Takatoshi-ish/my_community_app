import 'package:flutter/material.dart';
import '../../../../application/usecase/user/user_usecase.dart';
import '../../../../presentation/presentation_mixin.dart';
import '../../../../presentation/page/home_page.dart';
import '../../../../presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// サインインボタン
class SigninButton extends ConsumerWidget with PresentationMixin {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        execute(
          context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(userUsecaseProvider).signIn(
                  email: ref.read(signinEmailControllerProvider).text,
                  password: ref.read(signinPasswordControllerProvider).text,
                );
            navigator.pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          successMessage:
              '${ref.read(signinEmailControllerProvider).text} のユーザーでサインインしました',
        );
      },
      child: const Text('サインイン'),
    );
  }
}
