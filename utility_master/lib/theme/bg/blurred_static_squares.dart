import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BlurredStaticSquares extends StatefulWidget {
  final Color color; // The base color of the squares
  final double squareSize; // Size of each square
  final int minAnimationDuration; // Minimum duration of the fade animation
  final int maxAnimationDuration; // Maximum duration of the fade animation
  final double blurSigmaX; // Blur amount in the X direction
  final double blurSigmaY; // Blur amount in the Y direction

  const BlurredStaticSquares({
    super.key,
    this.color = const Color(0xFF5500ff),
    this.squareSize = 20.0,
    this.minAnimationDuration = 500,
    this.maxAnimationDuration = 2000,
    this.blurSigmaX = 20.0, // Increased blur value for X direction
    this.blurSigmaY = 20.0, // Increased blur value for Y direction
  });

  @override
  State<BlurredStaticSquares> createState() => _BlurredStaticSquaresState();
}

class _BlurredStaticSquaresState extends State<BlurredStaticSquares>
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
          Positioned.fill(
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: widget.blurSigmaX,
                    sigmaY: widget.blurSigmaY,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: widget.blurSigmaX * 1.5,
                    sigmaY: widget.blurSigmaY * 1.5,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: widget.blurSigmaX * 2.0,
                    sigmaY: widget.blurSigmaY * 2.0,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
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
