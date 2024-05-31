import 'package:arcane/arcane.dart';
import 'package:common_svgs/common_svgs.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/data/crud/crud.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:utility_master/theme/bg/blurred_static_squares.dart';
import 'package:utility_master/theme/theme_dark.dart';
import 'package:window_manager/window_manager.dart';

import 'firebase_options.dart';

void main() => Arcane(
    router: const ArcaneRouter(routes: [
      LandingPage(),
    ]),
    firebase: DefaultFirebaseOptions.currentPlatform,
    svgLogo: svgArcaneArts,
    events: ArcaneEvents(
        // onPreInit: () {
        //   services().register<MyAppService>(() => MyAppService());
        // },
        onWindowManagerShown: () {},
        onPostInit: () {},
        onAuthenticatedInit: (uid) async {},
        onLaunchComplete: () async {}),
    users: ArcaneUserProvider.fromCrud(
      userCapabilitiesCrud: (uid) => Crud.userCapabilities(uid),
      userCrud: (_) => Crud.user(),
      userPrivateCrud: (uid) => Crud.userSettings(uid),
      // This defines where the user document is (create on sign up)
      onCreateUserCapabilities: (u) => {},
      onCreateUserPrivate: (u) => {},
      onCreateUser: (u) => {
        "firstName": u.firstName,
        "lastName": u.lastName,
        "email": u.email,
        "uid": u.uid,
      },
      onUserUpdate: (user) {},
      onUserCapabilitiesUpdate: (userCapabilities) {},
      onUserPrivateUpdate: (userPrivate) {},
    ),
    // Define themes
    initialDarkTheme: ThemeData.dark(),
    initialLightTheme: ThemeData.light(),
    themeMods: [
      // (t) => t.copyWith(
      // colorScheme: t.colorScheme.copyWith(primary: Colors.red)),
    ],
    // lightThemeMods: [
    //   (t) =>
    //       t.copyWith(colorScheme: t.colorScheme.copyWith(tertiary: Colors.red)),
    // ],
    darkThemeMods: [],
    title: "ArcaneApp",
    windowOptions: const WindowOptions(
      center: true,
      alwaysOnTop: true,
      // minimumSize: Size(1600, 900),
    ),
    exitWindowOnClose: true,
    windowsGoogleSignInClientId:
        "809958656651-ta9g3u2ea0qh34uq78oclk0b0b44tct1.apps.googleusercontent.com",
    windowsGoogleSignInRedirectUri:
        "https://arcaneutilitymaster.firebaseapp.com/__/auth/handler",
    application: () => _themeSkuntPunch.map((v) {
          try {} catch (e, ee) {
            return v;
          }
          return v;
        }).build((_) => ShadTheme(
            data: shadTheme,
            child: ArcaneApp(
              background: Builder(
                builder: (context) => OpalBackground(
                  child: BlurredStaticSquares(
                      blurSigmaX: 40,
                      blurSigmaY: 40,
                      key: UniqueKey(),
                      squareSize: 35,
                      minAnimationDuration: 350,
                      maxAnimationDuration: 2000,
                      color: ShadTheme.of(context).colorScheme.ring.withOpacity(
                          0.5)), //opacity to 1 fir this one to look nice otherwise 0.5
                ),
              ),
              titleBar: const ArcaneTitleBar(
                title: PaddingLeft(padding: 10, child: Text("Utility Master")),
                leading:
                    Icon(Icons.hexagon_outlined, size: 25, color: Colors.white),
                theme: PlatformTheme.windows,
              ),
            ))),
    opalBackgroundOpacity: 0.75,
    opalCanvasOpacity: 0.75);

ShadThemeData get shadDarkTheme => ShadThemeData(
    colorScheme: MonochromeShadSlateColorScheme.red(),
    brightness: Brightness.dark);

ShadThemeData get shadLightTheme => ShadThemeData(
    colorScheme: MonochromeShadSlateColorScheme.blue(),
    brightness: Brightness.light);

ShadThemeData get shadTheme {
  try {
    return Arcane.isDark ? shadDarkTheme : shadLightTheme;
  } catch (e) {
    return shadLightTheme;
  }
}

BehaviorSubject<int> _themeSkuntPunch = BehaviorSubject<int>.seeded(0);
void themePunch() => _themeSkuntPunch.add(_themeSkuntPunch.value + 1);
