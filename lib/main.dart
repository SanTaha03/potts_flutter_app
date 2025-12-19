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

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // La liste des écrans est maintenant construite ici pour passer la fonction de rappel
    final List<Widget> screens = [
      DashboardScreen(onSeeAllPressed: () => _onTabChange(1)), // Navigue vers l'index 1 (Plantes)
      const PlantesScreen(),
      const ProblemePlanteScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1E7),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
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
              color: const Color(0xFF536A50),
              activeColor: const Color(0xFF384A37),
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
                  text: 'Problèmes',
                ),
                GButton(
                  icon: Icons.person_outline_rounded,
                  text: 'Mon compte',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onTabChange, // Utilise la nouvelle fonction
            ),
          ),
        ),
      ),
    );
  }
}
