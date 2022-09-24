import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yoji/provider/auth_provider.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController),
            OutlinedButton(
              onPressed: () => ref.read(authProvider.notifier).signIn(emailController.text, passwordController.text),
              child: const Text('Sign In'),
            ),
            OutlinedButton(
              onPressed: () => ref.read(authProvider.notifier).signUp(emailController.text, passwordController.text),
              child: const Text('Sign Up'),
            ),
            OutlinedButton(
              onPressed: () => ref.read(authProvider.notifier).signOut(),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
