import 'package:flutter/material.dart';

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
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text('Left Side'),
              ),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text('Right Side'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
