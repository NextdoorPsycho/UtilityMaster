import 'package:arcane/feature/application/router.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FullscreenPage extends ArcaneStatelessScreen {
  const FullscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fullscreen Page',
          style: TextStyle(color: ShadTheme.of(context).colorScheme.foreground),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: ShadTheme.of(context).colorScheme.foreground),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Text(
          'This is a fullscreen page.',
          style: TextStyle(color: ShadTheme.of(context).colorScheme.foreground),
        ),
      ),
    );
  }

  @override
  String toPath() => "/fullscreen";
}
