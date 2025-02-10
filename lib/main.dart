import 'package:flutter/material.dart';
import 'aibot.dart'; // Import the AIChatBotScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Track active menu item

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'title': 'Home'},
    {'icon': Icons.person, 'title': 'Profile'},
    {'icon': Icons.fitness_center, 'title': 'Your Fitness'},
    {'icon': Icons.chat, 'title': 'AI Chat Bot'},
    {'icon': Icons.medical_services, 'title': 'Near Doctors'},
    {'icon': Icons.post_add, 'title': 'Posts'},
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.logout, 'title': 'Logout'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/Images/DGF Industry.png", width: 100),
                  const Text(
                    "Neural Nexus",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      menuItems[index]['icon'],
                      color: selectedIndex == index ? Colors.teal : Colors.black,
                    ),
                    title: Text(
                      menuItems[index]['title'],
                      style: TextStyle(
                        fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                        color: selectedIndex == index ? Colors.teal : Colors.black,
                      ),
                    ),
                    selected: selectedIndex == index,
                    selectedTileColor: Colors.teal.withOpacity(0.2),
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update the selected index
                      });

                      Navigator.pop(context); // Close the drawer

                      // Navigate to the corresponding screen
                      if (menuItems[index]['title'] == 'AI Chat Bot') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AIChatBotScreen()),
                        ).then((_) {
                          // Reset the selected index to Home when returning from another screen
                          setState(() {
                            selectedIndex = 0; // Home is always active
                          });
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Neural Nexus"),
      ),
      body: Column(
        children: [
          // Title
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),

          // App Information Block
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About Neural Nexus",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Neural Nexus is your go-to platform for AI-driven health and fitness management. "
                      "Our AI Chat Bot helps you track your fitness goals, answer health-related queries, "
                      "and provides personalized recommendations to keep you at your best.",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to AI Chat Bot screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AIChatBotScreen()),
                    ).then((_) {
                      // Reset the selected index to Home when returning from another screen
                      setState(() {
                        selectedIndex = 0; // Home is always active
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Corrected property name
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20), // Padding added here
                  ),
                  child: const Text(
                    "Go to AI Chat Bot",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Scrolling Ads Section
          SizedBox(
            height: 180, // Set fixed height for horizontal scrolling
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling
              itemCount: 6, // Number of ad cards
              itemBuilder: (context, index) {
                return Container(
                  width: 250, // Width of each ad card
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.withOpacity(0.3), // Background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/Images/ad (${index + 1}).jpg", // Example ad images
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}