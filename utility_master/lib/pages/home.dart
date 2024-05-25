import 'package:flutter/material.dart';
import 'package:utility_master/theme/animated_ticking_icon.dart';
import 'package:utility_master/theme/button.dart';
import 'package:utility_master/theme/text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        const TickingIcon(icon: Icons.hexagon_outlined, size: 200),
        const SizedBox(height: 5),
        UMT.h0(context, "Utility Master"),
        const SizedBox(height: 15),
        UMT.animated(context, UMTStyle.p, const Duration(milliseconds: 100),
            'Change Everything'),
        const SizedBox(height: 40),
        UMB.themeToggle(context),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
