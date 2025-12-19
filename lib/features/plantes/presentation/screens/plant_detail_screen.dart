
import 'package:flutter/material.dart';
import 'package:flutterapplication/features/plantes/presentation/widgets/health_chart.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // --- Section supérieure : Image et Santé ---
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Carte Image
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                             image: const DecorationImage(
                              image: NetworkImage('assets/images/monsterra.png'), // Placeholder
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: const Icon(Icons.favorite_border, color: Colors.white70),
                                  onPressed: () {},
                                ),
                              ),
                              Positioned(
                                left: 12,
                                top: 12,
                                bottom: 12,
                                child: Container(
                                  width: 12,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.lightBlue.withAlpha(77)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FractionallySizedBox(
                                        heightFactor: 0.6, // The progress
                                        child: Container(
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Colonne de droite
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
                              const Spacer(),
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
                ),
                const SizedBox(height: 16),
                // --- Section Cartes d'info ---
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        icon: Icons.wb_sunny_outlined,
                        iconBgColor: const Color(0xFFF8EFE7),
                        iconColor: const Color(0xFFD49A6A),
                        value: 'Sud',
                        label: 'Exposition',
                        status: 'Adéquate',
                        statusBgColor: const Color(0xFFEAF1E7),
                        statusTextColor: const Color(0xFF384A37),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInfoCard(
                        icon: Icons.water_drop_outlined,
                        iconBgColor: const Color(0xFFE2EFFD),
                        iconColor: const Color(0xFF3B82F6),
                        value: '12%',
                        label: 'Humidité',
                        status: 'Insuffisante',
                        statusBgColor: const Color(0xFFF8EFE7),
                        statusTextColor: const Color(0xFFD49A6A),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInfoCard(
                        icon: Icons.thermostat_outlined,
                        iconBgColor: const Color(0xFFEAF1E7),
                        iconColor: const Color(0xFF536A50),
                        value: '21°',
                        label: 'Température',
                        status: 'Adéquate',
                        statusBgColor: const Color(0xFFEAF1E7),
                        statusTextColor: const Color(0xFF384A37),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // --- Section Descriptif ---
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFFEAF1E7),
                            child: Icon(Icons.eco_rounded, color: Color(0xFF536A50), size: 20),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Descriptif de la plante',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF384A37),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Le Monstera fait partie de la famille des Aracées, tout comme l\'Anthurium et le Philodendron.\n\nSes tiges sont épaisses et ses feuilles, souvent vertes, sont grandes. Avec suffisamment de lumière et d\'humidité, les feuilles se développent, formant des incisions profondes et/ou des trous. Les feuilles matures peuvent atteindre un diamètre d\'un mètre !\n\nEn raison de la taille, des incisions et des trous des feuilles, cette plante a été nommée « Monstrum », ce qui signifie « monstrueux » en latin.',
                        style: TextStyle(color: Colors.grey[700], height: 1.5, fontSize: 13),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // --- Section Plantes du même étage ---
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xFFF8EFE7),
                                child: Icon(Icons.local_florist_outlined, color: Color(0xFFD49A6A), size: 20),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Dans le même étage', // Changed Text
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF384A37),
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFE6E8E2)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            child: const Row(
                              children: [
                                Text('Voir tout', style: TextStyle(color: Color(0xFF384A37))),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xFF384A37)),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildPlantRow(
                        icon: Icons.local_florist_outlined,
                        color: const Color(0xFFD49A6A),
                        name: 'Calathea',
                        health: 89,
                        waterAmount: 0.8,
                      ),
                      const SizedBox(height: 12),
                      _buildPlantRow(
                        icon: Icons.eco_outlined,
                        color: const Color(0xFF9AB291),
                        name: 'Strelitzia',
                        health: 87,
                        waterAmount: 0.4,
                      ),
                      const SizedBox(height: 12),
                      _buildPlantRow(
                        icon: Icons.local_florist_outlined,
                        color: const Color(0xFFD49A6A),
                        name: 'Monstera',
                        health: 96,
                        waterAmount: 0.9,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String value,
    required String label,
    required String status,
    required Color statusBgColor,
    required Color statusTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF384A37))),
              CircleAvatar(backgroundColor: iconBgColor, radius: 14, child: Icon(icon, color: iconColor, size: 18)),
            ],
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: statusTextColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantRow({
    required IconData icon,
    required Color color,
    required String name,
    required int health,
    required double waterAmount,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFFF8EFE7),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF384A37))),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.favorite_rounded, color: Color(0xFFD49A6A), size: 14),
                  const SizedBox(width: 4),
                  Text('Santé : $health%', style: const TextStyle(fontSize: 12, color: Color(0xFF536A50))),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Quantité d\'eau', style: TextStyle(fontSize: 10, color: Colors.grey)),
              const SizedBox(height: 4),
              SizedBox(
                width: 100,
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: waterAmount,
                    backgroundColor: const Color(0xFFE6E8E2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6DA5D9)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
