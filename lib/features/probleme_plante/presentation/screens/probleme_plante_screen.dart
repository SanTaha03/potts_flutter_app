import 'package:flutter/material.dart';
import 'package:flutterapplication/features/probleme_plante/presentation/screens/report_problem_screen.dart';

class ProblemePlanteScreen extends StatefulWidget {
  const ProblemePlanteScreen({super.key});

  @override
  State<ProblemePlanteScreen> createState() => _ProblemePlanteScreenState();
}

class _ProblemePlanteScreenState extends State<ProblemePlanteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
       appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // --- Header Section ---
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // QR Scanner Button
                  _buildQrScannerButton(),
                  const SizedBox(height: 16),
                  const Text('OU', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  // Dropdowns
                  _buildDropdowns(),
                  const SizedBox(height: 16),
                  // Search and Filter
                  _buildSearchAndFilter(),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // --- Plant Grid ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 11, // Example count
                  itemBuilder: (context, index) {
                    return _buildPlantCard(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildQrScannerButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8EFE7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_scanner, color: Color(0xFFD49A6A)),
          SizedBox(width: 12),
          Text(
            'Scanner le QR d\'une plante',
            style: TextStyle(color: Color(0xFFD49A6A), fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }


  Widget _buildDropdowns() {
    return Row(
      children: [
        Expanded(
          child: _customDropdown('Bâtiment A', const Color(0xFFF8EFE7), const Color(0xFFD49A6A)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _customDropdown('Étage 3', const Color(0xFFF5F5F3), const Color(0xFF536A50)),
        ),
      ],
    );
  }

  Widget _customDropdown(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
          Icon(Icons.keyboard_arrow_down, color: textColor),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF5F5F3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.filter_list, color: const Color(0xFF536A50)),
        ),
      ],
    );
  }

  Widget _buildPlantCard(BuildContext context, int index) {
    // Example data
    final plantNames = ['Monstera', 'Bananier', 'Ficus', 'Calathea', 'Pachicia', 'Codiaeum', 'Dypsis', 'Monstera', 'Bananier', 'Ficus', 'Yucca'];
    final hasWarning = [true, false, false, false, true, false, false, false, false, false, false];

    return GestureDetector(
       onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReportProblemScreen()), 
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: NetworkImage('assets/images/monsterra.png'), // Placeholder image
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(plantNames[index], style: const TextStyle(color: Colors.white, fontSize: 12)),
                    if (hasWarning[index])
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(Icons.warning_amber_rounded, color: Colors.yellow, size: 12),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: SizedBox(
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.6, // Example value
                    backgroundColor: const Color(0xFFE6E8E2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6DA5D9)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
