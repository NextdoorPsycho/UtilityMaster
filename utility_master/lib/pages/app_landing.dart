import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_master/pages/home.dart';
import 'package:utility_master/pages/settings.dart';
import 'package:utility_master/theme/widgets/sidebar.dart';

// LandingPage with Sidebar
class LandingPage extends StatefulWidget {
  static void open(BuildContext context) => context.go("/");

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  // Pages for navigation
  final List<Widget> _pages = [
    const Home(),
    const Home(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          UMSidebar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            sidebarItems: [
              SideBarItem(iconSelected: Icons.home, text: 'Home'),
              SideBarItem(iconSelected: Icons.account_circle, text: 'Profile'),
              SideBarItem(iconSelected: Icons.settings, text: 'Settings'),
            ],
            widthSwitch:
                900, // This is an example breakpoint for a responsive layout
          ),
          Expanded(
            child: _pages.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
