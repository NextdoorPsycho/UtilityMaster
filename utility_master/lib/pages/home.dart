import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_master/theme/widgets/button.dart';
import 'package:utility_master/theme/widgets/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static void open(BuildContext context) => context.go("/");

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    setupAnimation();
  }

  void setupAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    _animationController.addStatusListener(handleAnimationStatus);
  }

  void handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() => _isAnimating = false);
      // Navigate to another page or perform some action
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_isAnimating) {
      setState(() => _isAnimating = true);
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        const SizedBox(child: Row(mainAxisAlignment: MainAxisAlignment.center)),
        buildAnimatedIcon(),
        const SizedBox(height: 5),
        UMT.h0(context, "Utility Master"),
        const SizedBox(height: 15),
        UMT.animated(context, UMTStyle.p, const Duration(milliseconds: 100),
            'Change Everything'),
        const SizedBox(height: 40),
        UMB.themeToggle(context),
        UMB.signOut(context),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }

  Widget buildAnimatedIcon() {
    return GestureDetector(
      onTap: _startAnimation,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) => Transform.rotate(
          angle: _animation.value,
          child: const Icon(Icons.hexagon_outlined, size: 200),
        ),
      ),
    );
  }
}
