import 'dart:math';

import 'package:flutter/material.dart';

class TiledSquares extends StatefulWidget {
  final Color color; // The base color of the squares
  final int gridSize; // Number of squares across one dimension
  final int minAnimationDuration; // Minimum duration of the fade animation
  final int maxAnimationDuration; // Maximum duration of the fade animation

  const TiledSquares({
    super.key,
    this.color = const Color(0xFF5500ff),
    this.gridSize = 20,
    this.minAnimationDuration = 500,
    this.maxAnimationDuration = 2000,
  });

  @override
  State<TiledSquares> createState() => _TiledSquaresState();
}

class _TiledSquaresState extends State<TiledSquares>
    with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];
  List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    _initializeGrid();
  }

  void _initializeGrid() {
    for (int i = 0; i < widget.gridSize * widget.gridSize; i++) {
      final controller = AnimationController(
        duration: Duration(
            milliseconds: Random().nextInt(
                    widget.maxAnimationDuration - widget.minAnimationDuration) +
                widget.minAnimationDuration),
        vsync: this,
      );
      final animation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCirc),
      );

      _controllers.add(controller);
      _animations.add(animation);
      controller.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.gridSize,
        ),
        itemCount: widget.gridSize * widget.gridSize,
        itemBuilder: (context, index) {
          return FadeTransition(
            opacity: _animations[index],
            child: Container(
              color: widget.color,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
