import 'package:flutter/material.dart';
import 'package:flutterapplication/features/dashboard/presentation/widgets/plant_health_gauge.dart';

class DashboardScreen extends StatelessWidget {
  final VoidCallback onSeeAllPressed;
  const DashboardScreen({super.key, required this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section des cartes supérieures
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carte de gauche (état de santé)
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '34',
                                  style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF384A37),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 12.0),
                                    child: Text(
                                      'Plantes en bonne santé',
                                      style: TextStyle(
                                        color: Color(0xFF536A50),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const PlantHealthGauge(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Cartes de droite
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          // Carte de température
                          _buildInfoCard(Icons.thermostat_outlined, const Color(0xFFEAF1E7), const Color(0xFF536A50), 'Temp. moyenne', '19°'),
                          const SizedBox(height: 16),
                          // Carte d'humidité
                          _buildInfoCard(Icons.water_drop_outlined, const Color(0xFFE2EFFD), const Color(0xFF3B82F6), 'Humidité moyenne', '63%'),
                        ],
                      ),
                    ),
                  ],
                ),
                 const SizedBox(height: 24),

                // Section Visite du prestataire
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
                            backgroundColor: Color(0xFFF8EFE7),
                            child: Icon(Icons.person_outline, color: Color(0xFFD49A6A), size: 20),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Visite du prestataire',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF384A37),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildVisitRow(
                        icon: Icons.arrow_forward,
                        title: 'Prochaine visite',
                        subtitle: 'Dans 6 jours',
                        trailing: 'Mer. 30 Avril',
                      ),
                      const Divider(height: 24, color: Color(0xFFF5F5F3)),
                       _buildVisitRow(
                        icon: Icons.check,
                        title: 'Dernière visite',
                        subtitle: 'Il y a 6 jours',
                        trailingIcon: Icons.copy_outlined,
                      ),
                       const Divider(height: 24, color: Color(0xFFF5F5F3)),
                       _buildVisitRow(
                        icon: Icons.check,
                        title: 'Dernière visite',
                        subtitle: 'Il y a 20 jours',
                        trailingIcon: Icons.copy_outlined,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                
                // Prochaine section ici
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
                                backgroundColor: Color(0xFFEAF1E7),
                                child: Icon(Icons.eco_rounded, color: Color(0xFF536A50), size: 20),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Plantes récemment consultées',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF384A37),
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: onSeeAllPressed,
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

  Widget _buildInfoCard(IconData icon, Color iconBg, Color iconColor, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBg,
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Color(0xFF536A50), fontSize: 12), softWrap: true),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF384A37))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVisitRow({
    required IconData icon,
    required String title,
    required String subtitle,
    String? trailing,
    IconData? trailingIcon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF536A50), size: 20),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF384A37))),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          if (trailing != null)
            Text(trailing, style: const TextStyle(color: Color(0xFF536A50), fontWeight: FontWeight.w500)),
          if (trailingIcon != null)
            Icon(trailingIcon, color: const Color(0xFF536A50), size: 20),
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
