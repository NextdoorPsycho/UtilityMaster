import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:padded/padded.dart';
import 'package:serviced/serviced.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/data/crud/crud.dart';
import 'package:utility_master/theme/widgets/text.dart';
import 'package:utility_master/util/magic.dart';
import 'package:utility_master/util/svc/user.dart';

class SettingsPage extends StatelessWidget {
  static void open(BuildContext context) => context.go("/settings");

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UMT.h1(context, "Settings"),
      ),
      body: SingleChildScrollView(
        child: PaddingAll(
            padding: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadSlider(
                  label: "Opacity for App",
                  onChanged: (value) {
                    Crud.userSettings(u).update("settings", {
                      "appOpacity": (svc<UserService>().lastUserSettings
                            ..setAppOpacity(value.toInt() / 100.0))
                          .appOpacity
                    });
                  },
                  initialValue: 100,
                  max: 100,
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Settings Page Content"),
                ),
              ],
            )),
      ),
    );
  }
}
