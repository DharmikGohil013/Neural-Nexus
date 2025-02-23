import 'package:flutter/material.dart';
import 'profile.dart'; // Import Profile Page
import 'articles.dart'; // Import Articles Page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fit Sync'),
        backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.article, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticlesPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.colorScheme.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/user.png'), // Replace with actual image
                  ),
                  SizedBox(height: 10),
                  Text("John Doe", style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text("johndoe@example.com", style: TextStyle(fontSize: 14, color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushReplacementNamed(context, '/'); // Navigate to Login
              },
            ),
          ],
        ),
      ),
      body: _buildHomeContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'AI Chatbot'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Lab Report'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Content'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        crossAxisCount: 2, // Two buttons per row
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildFeatureButton(Icons.directions_run, "Workout"),
          _buildFeatureButton(Icons.fastfood, "Nutrition"),
          _buildFeatureButton(Icons.monitor_heart, "Heart Health"),
          _buildFeatureButton(Icons.self_improvement, "Meditation"),
          _buildFeatureButton(Icons.local_hospital, "Nearby Doctors"), // Added Nearby Doctors button
        ],
      ),
    );
  }

  Widget _buildFeatureButton(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Implement Button Actions
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
