import 'package:arcane/arcane.dart';
import 'package:common_svgs/common_svgs.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/data/crud/crud.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:utility_master/theme/bg/tiled_squares.dart';
import 'package:utility_master/theme/theme_dark.dart';

import 'firebase_options.dart';

void main() => Arcane(
    router: const ArcaneRouter(routes: [LandingPage()]),
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
                  child: TiledSquares(
                      key: UniqueKey(),
                      gridSize: 20,
                      minAnimationDuration: 500,
                      maxAnimationDuration: 2000,
                      color: Arcane.isDark
                          ? const Color(0xFF020D2C)
                          : const Color(0xFFABC579)),
                ),
              ),
              titleBar: ArcaneTitleBar(
                title: const Text("Custom Title"),
                leading: SvgPicture.string(
                  svgArcaneArts,
                  width: 28,
                  height: 28,
                ),
                theme: PlatformTheme.windows,
              ),
            ))),
    opalBackgroundOpacity: 1,
    opalCanvasOpacity: 0.5);

ShadThemeData get shadDarkTheme => ShadThemeData(
    colorScheme: const MonochromeShadSlateColorScheme.dark(),
    brightness: Brightness.dark);

ShadThemeData get shadLightTheme => ShadThemeData(
    colorScheme: const MonochromeShadSlateColorScheme.light(),
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
