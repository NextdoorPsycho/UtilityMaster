import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_master/pages/home.dart';
import 'package:utility_master/theme/widgets/um_unified/um_sidebar.dart';

// Define the pages you will navigate to
class PageOne extends StatelessWidget {
  static void open(BuildContext context) => context.go("/page1");

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page One'));
  }
}

class PageTwo extends StatelessWidget {
  static void open(BuildContext context) => context.go("/page2");

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page Two'));
  }
}

class PageThree extends StatelessWidget {
  static void open(BuildContext context) => context.go("/page3");
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page Three'));
  }
}

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
    PageTwo(),
    PageThree(),
    const Home(),
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
