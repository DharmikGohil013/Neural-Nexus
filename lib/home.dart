  import 'package:flutter/material.dart';
  import 'aibot.dart'; // Import AI Chatbot page
  import 'home.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Section

              const SizedBox(height: 20),

              // Health Summary Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _healthCard("Steps", "8,450", Icons.directions_walk),
                  _healthCard("Calories", "2,350 kcal", Icons.local_fire_department),
                ],
              ),
              const SizedBox(height: 20),

              // Heart Rate & Sleep Tracking
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _healthCard("Heart Rate", "78 bpm", Icons.favorite),
                  _healthCard("Sleep", "7h 45m", Icons.nightlight_round),
                ],
              ),
              const SizedBox(height: 20),

              // Workout & Diet Buttons
              _actionButton("Start Workout", Icons.fitness_center, Colors.orange),
              const SizedBox(height: 10),
              _actionButton("View Diet Plan", Icons.fastfood, Colors.green),
            ],
          ),
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

    // Health Summary Cards
    Widget _healthCard(String title, String value, IconData icon) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.teal),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }

    // Action Button
    Widget _actionButton(String text, IconData icon, Color color) {
      return ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: const TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  // PlaceholderScreen Widget to prevent error
  class PlaceholderScreen extends StatelessWidget {
    final String title;

    const PlaceholderScreen(this.title);

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
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      );
    }
  }
