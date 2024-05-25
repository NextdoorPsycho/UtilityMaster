import 'package:arcane/arcane.dart';
import 'package:utility_master/pages/home.dart';
import 'package:utility_master/pages/settings.dart';
import 'package:utility_master/pages/showcase.dart';
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
