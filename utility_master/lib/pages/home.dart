import 'package:arcane/arcane.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/theme/animated_ticking_icon.dart';
import 'package:utility_master/theme/button.dart';

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
        const SizedBox(child: Row(mainAxisAlignment: MainAxisAlignment.center)),
        const TickingIcon(icon: Icons.hexagon_outlined, size: 200),
        const SizedBox(height: 5),
        Text("Utility Master", style: ShadTheme.of(context).textTheme.h1Large),
        const SizedBox(height: 15),
        Text("Change Everything", style: ShadTheme.of(context).textTheme.p),
        const SizedBox(height: 40),
        UMB.themeToggle(context),
      ],
    );
  }

  @override
  String toPath() => "/home";
}
