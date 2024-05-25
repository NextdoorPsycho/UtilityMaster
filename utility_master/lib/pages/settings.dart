import 'package:arcane/feature/application/router.dart';
import 'package:flutter/material.dart';
import 'package:padded/padded.dart';
import 'package:utility_master/theme/text.dart';

class SettingsPage extends ArcaneStatelessScreen {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UMT.h1(context, "Settings"),
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
