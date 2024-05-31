import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredStaticSquaresPainter extends CustomPainter {
  final Color color; // The base color of the squares
  final double squareSize; // Size of each square
  final double blurSigmaX; // Blur amount in the X direction
  final double blurSigmaY; // Blur amount in the Y direction

  BlurredStaticSquaresPainter({
    required this.color,
    required this.squareSize,
    required this.blurSigmaX,
    required this.blurSigmaY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var blurPaint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigmaX);

    var countHorizontal = (size.width / squareSize).floor();
    var countVertical = (size.height / squareSize).floor();

    for (var i = 0; i < countHorizontal; i++) {
      for (var j = 0; j < countVertical; j++) {
        var rect = Rect.fromLTWH(i * squareSize, j * squareSize, squareSize, squareSize);
        canvas.drawRect(rect, blurPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BlurredStaticSquares extends StatelessWidget {
  final Color color;
  final double squareSize;
  final int minAnimationDuration;
  final int maxAnimationDuration;
  final double blurSigmaX;
  final double blurSigmaY;

  const BlurredStaticSquares({
    Key? key,
    this.color = const Color(0xFF5500ff),
    this.squareSize = 20.0,
    this.minAnimationDuration = 500,
    this.maxAnimationDuration = 2000,
    this.blurSigmaX = 20.0,
    this.blurSigmaY = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BlurredStaticSquaresPainter(
        color: color,
        squareSize: squareSize,
        blurSigmaX: blurSigmaX,
        blurSigmaY: blurSigmaY,
      ),
    );
  }
}
