import 'package:flutter/material.dart';

class FullscreenPage extends StatelessWidget {
  const FullscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fullscreen Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Text('This is a fullscreen page.'),
      ),
    );
  }
}
