import 'package:fast_log/fast_log.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:universal_io/io.dart';
import 'package:utility_master/pages/home/home.dart';
import 'package:utility_master/theme/shad_dark.dart';

import 'data/admin/app_user_restricted.dart';
import 'data/crud.dart';
import 'data/user/app_user.dart';
import 'firebase_options.dart';

final providers = [EmailAuthProvider()];
String get u => FirebaseAuth.instance.currentUser!.uid;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseUIAuth.configureProviders([...providers]);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        Widget w = ShadApp.material(
          debugShowCheckedModeBanner: false,
          materialThemeBuilder: (context, theme) {
            return theme.copyWith(
              appBarTheme: const AppBarTheme(toolbarHeight: 52),
            );
          },
          darkTheme: ShadThemeData(
            brightness: Brightness.dark,
            colorScheme: const MonochromeShadSlateColorScheme.dark(),
          ),
          home: snapshot.hasData ? _buildMainApp() : _buildSignInScreen(),
          themeMode: _themeMode,
          theme: _themeMode == ThemeMode.dark
              ? ShadThemeData(
                  brightness: Brightness.dark,
                  colorScheme: const MonochromeShadSlateColorScheme.dark(),
                )
              : ShadThemeData(
                  brightness: Brightness.light,
                  colorScheme: const MonochromeShadSlateColorScheme.light(),
                ),
          routes: {
            '/login': (context) => _buildSignInScreen(),
            '/home': (context) => _buildMainApp(),
            '/admin': (context) => const Home(),
            //Dice
          },
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/login':
                return MaterialPageRoute(builder: (_) => _buildSignInScreen());
              case '/home':
                return MaterialPageRoute(builder: (_) => _buildMainApp());
              case '/admin':
                return MaterialPageRoute(builder: (_) => const Home());
              default:
                return MaterialPageRoute(builder: (_) => _buildSignInScreen());
            }
          },
        );
        return snapshot.hasData
            ? StreamBuilder<AppUser?>(
                stream: Crud.user().streamOrNull(u),
                builder: (context, f) {
                  if (f.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ThemeMode t = _themeMode;
                      _themeMode = f.data!.theme ? ThemeMode.light : ThemeMode.dark;
                      if (t != _themeMode) {
                        setState(() {
                          info("Theme changed to $_themeMode");
                        });
                      }
                    });
                  }
                  return StreamBuilder(
                      stream: Crud.userRestricted(u).streamOrNull("perms"),
                      builder: (context, s) => MultiProvider(
                            providers: [
                              Provider<AppUserRestricted?>.value(value: s.data),
                            ],
                            child: w,
                          ));
                })
            : w;
      },
    );
  }

  Widget _buildSignInScreen() {
    return SignInScreen(
      providers: providers,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          // Directly manage navigation based on auth state
        }),
      ],
    );
  }

  Widget _buildMainApp() {
    return const Home();
  }
}

class SignOutManager {
  static void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Forcibly reload the app or clear navigation stack
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
