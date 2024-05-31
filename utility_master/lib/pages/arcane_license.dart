import 'package:arcane/arcane.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// This is just simulating a mapping of license names to license text data
const Map<String, String> licenseTexts = {
  "MIT": "MIT License text",
  "Apache": "Apache License text",
  "GPL": "GPL License text",
};

// This arcane screen has a parameter the license key
// We need to do the following to make this parameter work:
// 1. Define the toPath() method to include the license field as /settings/license?license=<LICENSE> so we can GO to it
// 2. Define the buildRoute() method to build the screen based on a url such as /settings/license?license=MIT as LicenseViewerScreen(license: "MIT")
class LicenseViewerScreen extends ArcaneStatelessScreen {
  final String license;

  const LicenseViewerScreen({super.key, required this.license});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("License"),
        ),
        body: ShadCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(licenseTexts[license] ?? "Unknown license"),
          ),
          color: ShadTheme.of(context).colorScheme.card.withOpacity(0.5),
          shadow: BoxShadow(
            color: ShadTheme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ),
      );

  // Step 1. We need to use withParams to add our params.
  @override
  String toPath() => withParams("/settings/license", {
        "license": license,
      });

  // Step 2. We need to map the query params to the license key
  @override
  ArcaneRoute buildRoute({List<ArcaneRoute> subRoutes = const [], bool topLevel = false}) => ArcaneRoute(
        // Use toRegistryPath here
        path: toRegistryPath(topLevel: topLevel),
        // Build our screen with the params
        builder: buildWithParams((params) => LicenseViewerScreen(license: params["license"]!)),
        // Pass along subroutes
        routes: subRoutes,
      );
}
