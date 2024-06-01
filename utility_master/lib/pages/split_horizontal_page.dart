import 'package:flutter/material.dart';
import 'package:utility_master/lib/theme/glass_widget_design.dart'; // Import the GlassWidgetDesign class

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
            child: GlassBox( // Use GlassBox widget from GlassWidgetDesign
              blurX: 10.0, // Set blurX property for glassmorphic effect
              blurY: 10.0, // Set blurY property for glassmorphic effect
              child: const Center(
                child: Text('Left Side'),
              ),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: GlassBox( // Use GlassBox widget from GlassWidgetDesign
              blurX: 10.0, // Set blurX property for glassmorphic effect
              blurY: 10.0, // Set blurY property for glassmorphic effect
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
