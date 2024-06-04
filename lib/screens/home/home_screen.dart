import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const Text(
              'Home Page',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Welcome to the home page!'),
            const SizedBox(height: 10),
            const Text('Here are some items:'),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              subtitle: const Text('This is a favorite item.'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Star'),
              subtitle: const Text('This is a starred item.'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              subtitle: const Text('Adjust your settings here.'),
              onTap: () {
                // Handle the tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
