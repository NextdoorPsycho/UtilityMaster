import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplitHorizontalPage extends StatelessWidget {
  const SplitHorizontalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Horizontal Page'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: ShadCard(
              child: const Center(
                child: Text('Left Side'),
              ),
              color: ShadTheme.of(context).colorScheme.card.withOpacity(0.5),
              shadow: BoxShadow(
                color: ShadTheme.of(context).colorScheme.shadow.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: ShadCard(
              child: const Center(
                child: Text('Right Side'),
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
