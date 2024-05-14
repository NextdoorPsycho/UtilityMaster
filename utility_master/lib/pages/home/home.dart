import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/data/crud.dart';
import 'package:utility_master/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimating = false;
        });
        // Nav.goToHome(context);
      }
    });
  }

  void _startAnimation() {
    if (!_isAnimating) {
      setState(() {
        _isAnimating = true;
      });
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            GestureDetector(
              onTap: _startAnimation,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform(
                    alignment: const Alignment(0, 0.0),
                    transform: Matrix4.rotationZ(_animation.value + pi),
                    child: const Icon(
                      Icons.hexagon_outlined,
                      size: 200,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Utility Master',
              style: ShadTheme.of(context).textTheme.h1Large,
            ),
            const SizedBox(height: 15),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                    cursor: '|',
                    'Change Everything',
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 60),
                    textStyle: TextStyle(
                      fontSize: ShadTheme.of(context).textTheme.lead.fontSize,
                      fontWeight: ShadTheme.of(context).textTheme.lead.fontWeight,
                      letterSpacing: ShadTheme.of(context).textTheme.lead.letterSpacing,
                      // make color a hexcode
                      color: Colors.grey,
                    )),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: false,
              stopPauseOnTap: false,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadButton(
                  onPressed: () {
                    Crud.user().txn(u, (data) => data..toggleTheme());
                  },
                  icon: Text(
                    'Toggle Theme',
                    style: ShadTheme.of(context).textTheme.p,
                  ),
                ),
              ],
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
