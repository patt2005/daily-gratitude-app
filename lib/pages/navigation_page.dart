import 'package:daily_gratitude_journal/pages/home_page.dart';
import 'package:daily_gratitude_journal/pages/settings_page.dart';
import 'package:daily_gratitude_journal/utilities/utils.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const SettingsPage(),
  ];
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: NavigationBar(
        indicatorColor: const Color(0xFFFFB4C2),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        selectedIndex: _selectedPageIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedPageIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.house_rounded),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_rounded),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
