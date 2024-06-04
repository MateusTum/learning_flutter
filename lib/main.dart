import 'package:flutter/material.dart';

// Import screens
import 'screens/index.dart';
// Import SideNav
import 'widgets/sidenav/side_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isDarkTheme = true;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        isDarkTheme: _isDarkTheme,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isDarkTheme;
  final Function toggleTheme;

  const HomePage({
    required this.isDarkTheme,
    required this.toggleTheme,
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Homepage'),
      ),
      drawer: SideNav(
        isDarkTheme: widget.isDarkTheme,
        toggleTheme: widget.toggleTheme,
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
