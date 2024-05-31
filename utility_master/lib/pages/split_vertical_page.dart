import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplitVerticalPage extends StatelessWidget {
  const SplitVerticalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Vertical Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ShadCard(
              child: const Center(
                child: Text('Top Side'),
              ),
              color: ShadTheme.of(context).colorScheme.card.withOpacity(0.5),
              shadow: BoxShadow(
                color: ShadTheme.of(context).colorScheme.shadow.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ShadCard(
              child: const Center(
                child: Text('Bottom Side'),
              ),
              color: ShadTheme.of(context).colorScheme.card.withOpacity(0.5),
              shadow: BoxShadow(
                color: ShadTheme.of(context).colorScheme.shadow.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
