import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StaticSquares extends StatefulWidget {
  final Color color; // The base color of the squares
  final double squareSize; // Size of each square
  final int minAnimationDuration; // Minimum duration of the fade animation
  final int maxAnimationDuration; // Maximum duration of the fade animation

  const StaticSquares({
    super.key,
    this.color = const Color(0xFF5500ff),
    this.squareSize = 20.0,
    this.minAnimationDuration = 500,
    this.maxAnimationDuration = 2000,
  });

  @override
  State<StaticSquares> createState() => _StaticSquaresState();
}

class _StaticSquaresState extends State<StaticSquares>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeGrid());
  }

  void _initializeGrid() {
    final int horizontalCount =
        (MediaQuery.of(context).size.width / widget.squareSize).ceil();
    final int verticalCount =
        (MediaQuery.of(context).size.height / widget.squareSize).ceil();
    final int totalSquares = horizontalCount * verticalCount;

    for (int i = 0; i < totalSquares; i++) {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int horizontalCount =
        (MediaQuery.of(context).size.width / widget.squareSize).ceil();
    final int verticalCount =
        (MediaQuery.of(context).size.height / widget.squareSize).ceil();
    final int totalSquares = horizontalCount * verticalCount;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color:
                ShadTheme.of(context).colorScheme.background.withOpacity(0.02),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: horizontalCount,
              childAspectRatio: 1.0,
            ),
            itemCount: totalSquares,
            itemBuilder: (context, index) {
              return FadeTransition(
                opacity: _animations.isNotEmpty
                    ? _animations[index % _animations.length]
                    : const AlwaysStoppedAnimation(1.0),
                child: Container(
                  color: widget.color,
                ),
              );
            },
          ),
        ],
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
