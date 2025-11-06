import 'package:flutter/material.dart';
import 'package:flutterapplication/features/account/presentation/screens/account_screen.dart';
import 'package:flutterapplication/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutterapplication/features/plantes/presentation/screens/plantes_screen.dart';
import 'package:flutterapplication/features/probleme_plante/presentation/screens/probleme_plante_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBFBFB),
        primarySwatch: Colors.green,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    DashboardScreen(),
    PlantesScreen(),
    ProblemePlanteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Use IndexedStack to preserve state of each tab
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        // Use the scaffold background color for the area behind the floating nav bar
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24), // Add safe area padding at the bottom
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1E7), // Light green background from image
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
            child: GNav(
              backgroundColor: Colors.transparent,
              color: const Color(0xFF536A50), // Unselected icon/text color
              activeColor: const Color(0xFF384A37), // Selected icon/text color
              tabBackgroundColor: Colors.white,
              haptic: true,
              gap: 8,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              tabBorderRadius: 20,
              tabs: const [
                GButton(
                  icon: Icons.dashboard_rounded,
                  text: 'Dashboard',
                ),
                GButton(
                  icon: Icons.eco_rounded,
                  text: 'Plantes',
                ),
                GButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  text: 'Problèmes', // Shortened Text
                ),
                GButton(
                  icon: Icons.person_outline_rounded,
                  text: 'Mon compte',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
