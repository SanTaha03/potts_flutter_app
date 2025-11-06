import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      appBar: AppBar(
        title: const Text(
          'Mon Compte',
          style: TextStyle(color: Color(0xFF384A37), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // --- User Info Header ---
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFEAF1E7),
                  child: Icon(Icons.person, size: 40, color: Color(0xFF536A50)),
                ),
                SizedBox(height: 16),
                Text(
                  'Taha Tadil', // Example Name
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF384A37)),
                ),
                SizedBox(height: 4),
                Text(
                  'taha.tadil@email.com', // Example Email
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // --- Menu Options ---
          _buildMenuSection(
            title: 'COMPTE',
            children: [
              _buildListTile(icon: Icons.edit_outlined, title: 'Modifier le profil'),
              _buildListTile(icon: Icons.notifications_outlined, title: 'Notifications'),
            ],
          ),

          const SizedBox(height: 24),

          _buildMenuSection(
            title: 'SUPPORT',
            children: [
              _buildListTile(icon: Icons.help_outline, title: 'Aide et support'),
              _buildListTile(icon: Icons.info_outline, title: 'À propos'),
            ],
          ),
          
          const SizedBox(height: 32),

          // --- Logout Button ---
          Center(
            child: TextButton(
              onPressed: () {
                // TODO: Implement logout logic
              },
              child: const Text(
                'Déconnexion',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
        Container(
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildListTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF536A50)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF384A37))),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {},
    );
  }
}
