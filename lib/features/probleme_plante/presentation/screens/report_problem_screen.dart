import 'package:flutter/material.dart';
import 'package:flutterapplication/features/plantes/presentation/widgets/health_chart.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F3),
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Color(0xFF384A37)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // --- Copied from Plant Detail Screen ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Plant Image Card
                Expanded(
                  flex: 4,
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                       child: Stack(
                        children: [
                          const Center(
                            child: Icon(Icons.local_florist_rounded, size: 100, color: Color(0xFF9AB291)),
                          ),
                          Positioned(
                            top: 8, right: 8,
                            child: IconButton(icon: const Icon(Icons.favorite_border, color: Colors.grey), onPressed: () {}),
                          ),
                           Positioned(
                            left: 12, top: 12, bottom: 12,
                            child: Container(
                              width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.lightBlue.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.6,
                                    child: Container(color: Colors.lightBlue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Health Card
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Calathea', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF384A37))),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            Text('Ma plante de bureau', style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 4),
                            Icon(Icons.edit, size: 14, color: Colors.grey)
                          ],
                        ),
                        const SizedBox(height: 8),
                         Chip(
                          label: const Text('Bureau 13L', style: TextStyle(fontSize: 12)),
                          avatar: const Icon(Icons.location_on_outlined, size: 14),
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                           backgroundColor: const Color(0xFFF5F5F3),
                        ),
                        const SizedBox(height: 16),
                        const Text('Santé global', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF384A37))),
                        const SizedBox(height: 8),
                        const SizedBox(height: 80, child: HealthChart()),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Text('LUN', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             Text('MAR', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             Text('MER', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             Text('JEU', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             Text('VEN', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             Text('SAM', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             Text('DIM', style: TextStyle(color: Colors.grey, fontSize: 10)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Les champs muni d\'un * sont obligatoire',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 16),

            // --- Photo Section ---
            _buildSectionTitle('Photo du problème', isRequired: true),
            const SizedBox(height: 8),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.add_photo_alternate_outlined, color: Color(0xFFD49A6A), size: 40),
              ),
            ),

            const SizedBox(height: 24),

            // --- Description Section ---
            _buildSectionTitle('Plus de précision sur le problème'),
            const SizedBox(height: 8),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Ma description...',
                filled: true,
                fillColor: Colors.white,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // --- Submit Button ---
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9AB291),
                foregroundColor: const Color(0xFF384A37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Envoyer le rapport', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool isRequired = false}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF384A37)),
        ),
        if (isRequired)
          const Text(' *', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
