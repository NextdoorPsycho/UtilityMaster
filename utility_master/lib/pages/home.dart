import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_master/theme/animatory/ticking_icon.dart';
import 'package:utility_master/theme/widgets/button.dart';
import 'package:utility_master/theme/widgets/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static void open(BuildContext context) => context.go("/");

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        const TickingIcon(icon: Icons.hexagon_outlined, size: 200),
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
}
