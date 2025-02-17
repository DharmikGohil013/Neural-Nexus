import 'package:flutter/material.dart';
import 'content.dart'; // Import the ContentScreen for video feed
import 'aibot.dart'; // Import AI Chatbot page

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for bottom navigation
  final List<Widget> _screens = [
    const PlaceholderScreen("Home"),
    const PlaceholderScreen("Search"),
    const PlaceholderScreen("Add"),
    const PlaceholderScreen("Videos"),
    const AIBotScreen(), // AI Chatbot screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Neural-Nexus"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.rocket_launch, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AIBotScreen()),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context), // Drawer Menu
      body: _screens[_selectedIndex], // Switch between screens based on the selected index

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  // Drawer Menu
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.health_and_safety, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Health App",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
          _drawerItem("Dashboard", Icons.dashboard, context, const HomeScreen()),
          _drawerItem("Workout Tracker", Icons.fitness_center, context, const PlaceholderScreen("Workout Tracker")),
          _drawerItem("Diet & Nutrition", Icons.fastfood, context, const PlaceholderScreen("Diet & Nutrition")),
          _drawerItem("Heart Rate Monitor", Icons.favorite, context, const PlaceholderScreen("Heart Rate Monitor")),
          _drawerItem("Sleep Analysis", Icons.nightlight_round, context, const PlaceholderScreen("Sleep Analysis")),
          _drawerItem("AI Chatbot", Icons.rocket_launch, context, const AIBotScreen()),

          const Divider(),
          _drawerItem("Settings", Icons.settings, context, const PlaceholderScreen("Settings")),
          _drawerItem("Logout", Icons.logout, context, const PlaceholderScreen("Logout")),
        ],
      ),
    );
  }

  // Drawer Item Widget
  Widget _drawerItem(String title, IconData icon, BuildContext context, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pop(context); // Close the drawer first
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

// PlaceholderScreen Widget to prevent error
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          '$title Content Here',
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
