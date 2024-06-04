import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class TriangleBG extends StatefulWidget {
  final bool blurred;
  final double blurSigmaX;
  final double blurSigmaY;

  const TriangleBG({
    Key? key,
    this.blurred = false,
    this.blurSigmaX = 10.0,
    this.blurSigmaY = 10.0,
  }) : super(key: key);

  @override
  _TriangleBGState createState() => _TriangleBGState();
}

class _TriangleBGState extends State<TriangleBG> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: TrianglePainter(_animation.value, widget.blurred, widget.blurSigmaX, widget.blurSigmaY),
          child: Container(),
        );
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  final double angle;
  final bool blurred;
  final double blurSigmaX;
  final double blurSigmaY;

  TrianglePainter(this.angle, this.blurred, this.blurSigmaX, this.blurSigmaY);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height / 4);
    path.lineTo(size.width / 4, 3 * size.height / 4);
    path.lineTo(3 * size.width / 4, 3 * size.height / 4);
    path.close();

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angle);
    canvas.translate(-size.width / 2, -size.height / 2);
    if (blurred) {
      canvas.saveLayer(null, Paint()..imageFilter = ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY));
    }
    canvas.drawPath(path, paint);
    if (blurred) {
      canvas.restore();
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
