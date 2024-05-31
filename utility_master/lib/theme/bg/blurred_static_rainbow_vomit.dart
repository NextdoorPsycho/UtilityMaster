import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StaticSquaresRainbowVomit extends StatefulWidget {
  final Color color;
  final double squareSize;
  final int minAnimationDuration;
  final int maxAnimationDuration;
  final double blurSigmaX;
  final double blurSigmaY;
  final bool blurred;
  final bool hueshift;
  final double opacity;

  const StaticSquaresRainbowVomit({
    super.key,
    this.color = const Color(0xFF5500ff),
    this.squareSize = 20.0,
    this.minAnimationDuration = 500,
    this.maxAnimationDuration = 2000,
    this.blurSigmaX = 20.0,
    this.blurSigmaY = 20.0,
    this.blurred = false,
    this.hueshift = false,
    this.opacity = 1.0,
  });

  @override
  State<StaticSquaresRainbowVomit> createState() => _StaticSquaresState();
}

class _StaticSquaresState extends State<StaticSquaresRainbowVomit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Offset>? _positions;
  List<int>? _durations;
  List<double>? _phases;
  List<int>? _colorDurations;
  List<double>? _colorPhases;
  final Random _random = Random();
  Size? _previousSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  void _initializeGrid(Size size) {
    final int horizontalCount = (size.width / widget.squareSize).ceil();
    final int verticalCount = (size.height / widget.squareSize).ceil();
    final int totalSquares = horizontalCount * verticalCount;

    _positions = List.generate(
      totalSquares,
      (index) {
        final x = (index % horizontalCount) * widget.squareSize;
        final y = (index ~/ horizontalCount) * widget.squareSize;
        return Offset(x, y);
      },
    );

    _durations = List.generate(
      totalSquares,
      (_) =>
          _random.nextInt(
              widget.maxAnimationDuration - widget.minAnimationDuration) +
          widget.minAnimationDuration,
    );

    _phases = List.generate(
      totalSquares,
      (_) => _random.nextDouble() * 2 * pi,
    );

    if (widget.hueshift) {
      _colorDurations = List.generate(
        totalSquares,
        (_) =>
            _random.nextInt(
                widget.maxAnimationDuration - widget.minAnimationDuration) +
            widget.minAnimationDuration,
      );

      _colorPhases = List.generate(
        totalSquares,
        (_) => _random.nextDouble() * 2 * pi,
      );
    }

    _previousSize = size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final newSize = Size(constraints.maxWidth, constraints.maxHeight);
          if (_positions == null || _previousSize != newSize) {
            _initializeGrid(newSize);
          }
          return Stack(
            children: [
              Container(
                color: ShadTheme.of(context)
                    .colorScheme
                    .background
                    .withOpacity(0.02),
              ),
              CustomPaint(
                painter: SquaresPainter(
                  color: widget.color,
                  positions: _positions!,
                  durations: _durations!,
                  phases: _phases!,
                  controller: _controller,
                  squareSize: widget.squareSize,
                  hueshift: widget.hueshift,
                  opacity: widget.opacity,
                  colorDurations: _colorDurations,
                  colorPhases: _colorPhases,
                ),
                child: Container(),
              ),
              if (widget.blurred)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: widget.blurSigmaX * 2,
                      sigmaY: widget.blurSigmaY * 2,
                    ),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SquaresPainter extends CustomPainter {
  final Color color;
  final List<Offset> positions;
  final List<int> durations;
  final List<double> phases;
  final Animation<double> controller;
  final double squareSize;
  final bool hueshift;
  final double opacity;
  final List<int>? colorDurations;
  final List<double>? colorPhases;

  SquaresPainter({
    required this.color,
    required this.positions,
    required this.durations,
    required this.phases,
    required this.controller,
    required this.squareSize,
    required this.hueshift,
    required this.opacity,
    this.colorDurations,
    this.colorPhases,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withOpacity(opacity);

    for (int i = 0; i < positions.length; i++) {
      final offset = positions[i];
      final time = (controller.value + (phases[i] / (2 * pi))) % 1;
      final localOpacity = (sin(time * 2 * pi) * 0.5 + 0.5).toDouble();
      paint.color = color.withOpacity(localOpacity * opacity);

      if (hueshift && colorDurations != null && colorPhases != null) {
        final colorTime = (controller.value + (colorPhases![i] / (2 * pi))) % 1;
        final hue = (colorTime * 360).toDouble();
        paint.color = HSLColor.fromAHSL(
          localOpacity * opacity,
          hue,
          1.0,
          0.5,
        ).toColor();
      }

      canvas.drawRect(
          Rect.fromLTWH(offset.dx, offset.dy, squareSize, squareSize), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
