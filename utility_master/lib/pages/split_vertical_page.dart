import 'package:flutter/material.dart';
import 'package:utility_master/theme/glass_widget_design.dart';

class SplitVerticalPage extends StatelessWidget {
  const SplitVerticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Vertical Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GlassWidgetDesign.glassBox(
              // Use GlassBox widget from GlassWidgetDesign
              blurX: 10.0, // Set blurX property for glassmorphic effect
              blurY: 10.0, // Set blurY property for glassmorphic effect
              child: const Center(
                child: Text('Top Side'),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: GlassWidgetDesign.glassBox(
              // Use GlassBox widget from GlassWidgetDesign
              blurX: 10.0, // Set blurX property for glassmorphic effect
              blurY: 10.0, // Set blurY property for glassmorphic effect
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
