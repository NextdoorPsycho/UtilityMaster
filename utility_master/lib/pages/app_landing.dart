import 'package:arcane/arcane.dart';
import 'package:utility_master/pages/example_page.dart';
import 'package:utility_master/pages/fullscreen_page.dart';
import 'package:utility_master/pages/home.dart';
import 'package:utility_master/pages/settings.dart';
import 'package:utility_master/pages/showcase.dart';
import 'package:utility_master/pages/split_horizontal_page.dart';
import 'package:utility_master/pages/split_vertical_page.dart';
import 'package:utility_master/theme/animated_sidebar.dart';

class LandingPage extends ArcaneStatefulScreen {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();

  @override
  String toPath() => "/";
}

class _LandingPageState extends State<LandingPage> {
  late int _selectedIndex;

  // Pages for navigation
  final List<Widget> _pages = [
    const Home(),
    const ShowcasePage(),
    const LicensePage(),
    const ExamplePage(),
    const FullscreenPage(),
    const SplitHorizontalPage(),
    const SplitVerticalPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          AnimatedSidebar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            sidebarItems: [
              SideBarItem(iconSelected: Icons.home, text: 'Home'),
              SideBarItem(iconSelected: Icons.build, text: 'Showcase'),
              SideBarItem(iconSelected: Icons.info, text: 'License'),
              SideBarItem(iconSelected: Icons.code, text: 'Example'),
              SideBarItem(iconSelected: Icons.fullscreen, text: 'Fullscreen'),
              SideBarItem(
                  iconSelected: Icons.vertical_split_outlined,
                  text: 'Split Horizontal'),
              SideBarItem(
                  iconSelected: Icons.horizontal_split_outlined,
                  text: 'Split Vertical'),
              SideBarItem(iconSelected: Icons.settings, text: 'Settings'),
            ],
            widthSwitch: 900, // Example breakpoint for a responsive layout
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}
