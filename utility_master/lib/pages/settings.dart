import 'package:arcane/feature/application/router.dart';
import 'package:flutter/material.dart';
import 'package:padded/padded.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SettingsPage extends ArcaneStatelessScreen {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: ShadTheme.of(context).textTheme.h1),
      ),
      body: const SingleChildScrollView(
        child: PaddingAll(
            padding: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

  @override
  String toPath() => "/settings";
}
