import 'package:flutter/material.dart';
import 'dart:ui';

class SideNav extends StatelessWidget {
  final bool isDarkTheme;
  final Function toggleTheme;
  final Function onItemTapped;
  final int selectedIndex;

  const SideNav({
    required this.isDarkTheme,
    required this.toggleTheme,
    required this.onItemTapped,
    required this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.zero,
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.7),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black.withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.red
                        : Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Navigation',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () => onItemTapped(0),
                ),
                ListTile(
                  leading: const Icon(Icons.search),
                  title: const Text('Search'),
                  onTap: () => onItemTapped(1),
                ),
                ExpansionTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        // Handle the tap
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        // Handle the tap
                      },
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ListTile(
                leading: const Icon(Icons.brightness_6),
                title: const Text('Toggle Theme'),
                trailing: Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
