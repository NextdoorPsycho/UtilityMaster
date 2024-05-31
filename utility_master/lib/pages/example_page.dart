import 'package:arcane/arcane.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
        child: ShadButton.outline(
          onPressed: () => const FullscreenPage().open(context),
          text: const Text('Go to Fullscreen Page'),
        ),
      ),
    );
  }
}
