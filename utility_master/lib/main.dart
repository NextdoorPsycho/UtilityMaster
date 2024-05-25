import 'package:arcane/arcane.dart';
import 'package:common_svgs/common_svgs.dart';
import 'package:utility_master/data/crud/crud.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:window_manager/window_manager.dart';

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
      lightThemeMods: [
        // (t) => t.copyWith(cardColor: Colors.white)
      ],
      darkThemeMods: [],
      title: "ArcaneApp",
      exitWindowOnClose: true,
      windowOptions: const WindowOptions(size: Size(800, 600), center: true),
      windowsGoogleSignInClientId:
          "809958656651-ta9g3u2ea0qh34uq78oclk0b0b44tct1.apps.googleusercontent.com",
      windowsGoogleSignInRedirectUri:
          "https://arcaneutilitymaster.firebaseapp.com/__/auth/handler",
      application: () => ArcaneApp(
        foregroundBuilder: (context, child) => child,
        background: const OpalBackground(),
        titleBar: ArcaneTitleBar(
          title: const Text("Custom Title"),
          leading: SvgPicture.string(
            svgArcaneArts,
            width: 28,
            height: 28,
          ),
          theme: PlatformTheme.windows,
        ),
      ),
    );
