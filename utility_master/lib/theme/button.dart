import 'package:arcane/arcane.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/main.dart';

class UMB {
  static Widget themeToggle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton(
          onPressed: () {
            info("Toggled Theme");
            Arcane.themeMode = Arcane.isDark ? ThemeMode.light : ThemeMode.dark;
            themePunch();
          },
          icon: Text(
            'Toggle Theme',
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
      ],
    );
  }
}
