import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'fullscreen_page.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/fullscreen'),
          child: const Text('Go to Fullscreen Page'),
        ),
      ),
    );
  }
}
