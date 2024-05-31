import 'dart:ui';

import 'package:flutter/material.dart';

class StaticSquaresPainter extends CustomPainter {
  final Color color; // The base color of the squares
  final double squareSize; // Size of each square

  StaticSquaresPainter({
    required this.color,
    required this.squareSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var countHorizontal = (size.width / squareSize).floor();
    var countVertical = (size.height / squareSize).floor();

    for (var i = 0; i < countHorizontal; i++) {
      for (var j = 0; j < countVertical; j++) {
        var rect = Rect.fromLTWH(i * squareSize, j * squareSize, squareSize, squareSize);
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StaticSquares extends StatelessWidget {
  final Color color;
  final double squareSize;

  const StaticSquares({
    Key? key,
    this.color = const Color(0xFF5500ff),
    this.squareSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StaticSquaresPainter(
        color: color,
        squareSize: squareSize,
      ),
    );
  }
}
