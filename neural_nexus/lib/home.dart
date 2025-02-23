import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neural-Nexus'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    'Please log in to continue.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                _buildButtonGrid(),
                const SizedBox(height: 20),
                const Text(
                  'Nearby Doctors',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                const SizedBox(height: 10),
                _buildDoctorList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: const [
        _FeatureButton(icon: Icons.dashboard, label: 'Dashboard'),
        _FeatureButton(icon: Icons.fitness_center, label: 'Workout'),
        _FeatureButton(icon: Icons.fastfood, label: 'Diet'),
        _FeatureButton(icon: Icons.favorite, label: 'Heart'),
        _FeatureButton(icon: Icons.nightlight_round, label: 'Sleep'),
        _FeatureButton(icon: Icons.smart_toy, label: 'AI Bot'),
      ],
    );
  }

  Widget _buildDoctorList() {
    return Column(
      children: const [
        DoctorTile(name: 'Dr. Gadara Krishna'),
        DoctorTile(name: 'Dr. Dharmik'),
        DoctorTile(name: 'Dr. Fitness Fi...'),
        DoctorTile(name: 'Dr. Yash'),
      ],
    );
  }
}

class _FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final String name;
  const DoctorTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person, color: Colors.teal),
      title: Text(name, style: const TextStyle(fontSize: 16)),
    );
  }
}