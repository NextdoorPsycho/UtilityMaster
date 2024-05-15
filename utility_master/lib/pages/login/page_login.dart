import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:utility_master/pages/login/login_content.dart';
import 'package:utility_master/util/bloc/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static void open(BuildContext context) => context.go("/login");

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
        return state == LoginState.loading || state == LoginState.success
            ? const Scaffold(
                body: Center(
                    child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              )))
            : const Scaffold(
                body: Align(
                  alignment: Alignment.center,
                  child: LoginContent(),
                ),
              );
      }, listener: (context, state) {
        if (state == LoginState.error) {
        } else if (state == LoginState.success) {
          LandingPage.open(context);
        }
      });
}
