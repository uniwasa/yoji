import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yoji/provider/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => ref.read(authProvider.notifier).signOut(),
        ),
      ),
      body: const Center(child: Text('home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/login'),
      ),
    );
  }
}
