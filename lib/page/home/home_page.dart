import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/login'),
      ),
    );
  }
}
