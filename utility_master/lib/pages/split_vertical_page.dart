import 'package:flutter/material.dart';

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
            child: Container(
              color: Colors.amber,
              child: const Center(
                child: Text('Top Side'),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text('Bottom Side'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
