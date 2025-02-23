import 'package:flutter/material.dart';
import 'articles.dart';
import 'profile.dart';
import 'aichatbot.dart';
import 'labreport.dart';
import 'content.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    const AIChatbotPage(),
    const LabReportPage(),
    const ContentPage(), // ✅ Correctly integrate ContentPage
    const ProfilePage(),
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
        title: const Text('Fit Sync'),
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.article),
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
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Implement settings page navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "AI Chatbot"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Lab Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.content_copy), label: "Content"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Health Tracking",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _buildFeatureButton(context, "Heart Rate", Icons.favorite),
              _buildFeatureButton(context, "Step Counter", Icons.directions_walk),
              _buildFeatureButton(context, "Sleep Tracking", Icons.nightlight_round),
              _buildFeatureButton(context, "Calorie Tracker", Icons.local_dining),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Nearby Doctors",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          DoctorCard(name: "Dr. Smith", specialty: "Cardiologist"),
          DoctorCard(name: "Dr. Johnson", specialty: "Dentist"),
          DoctorCard(name: "Dr. Patel", specialty: "Orthopedic"),
          DoctorCard(name: "Dr. Lee", specialty: "Neurologist"),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        // TODO: Implement feature navigation
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;

  const DoctorCard({super.key, required this.name, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // TODO: Implement doctor profile navigation
        },
      ),
    );
  }
}