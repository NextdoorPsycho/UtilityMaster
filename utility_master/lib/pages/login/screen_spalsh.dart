import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serviced/serviced.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:utility_master/pages/login/page_login.dart';
import 'package:utility_master/util/svc/login.dart';
import 'package:utility_master/util/svc/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static void open(BuildContext context) => context.go("/splash");

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    verbose("Splashed");
    Future.delayed(const Duration(milliseconds: 25), () {
      if (svc<LoginService>().isSignedIn()) {
        success("We are already signed in");
        svc<UserService>().bind(svc<UserService>().uid()).then((value) {
          LandingPage.open(context);
        });
      } else {
        verbose("Not yet signed in. Going to login.");
        LoginScreen.open(context);
      }
    });
    verbose("IOnit splasha");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(),
    )));
  }
}
