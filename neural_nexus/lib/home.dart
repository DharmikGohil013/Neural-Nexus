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
    const ContentPage(),
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
        title: const Text(
          'Fit Sync',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.article, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticlesPage()),
              );
            },
            tooltip: 'View Articles',
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SafeArea(child: _pages[_selectedIndex]),
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue.shade50,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.1,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.width * 0.12,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    const Text(
                      'Fit Sync User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.home,
                    title: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => _selectedIndex = 0);
                    },
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => _selectedIndex = 4);
                    },
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Implement settings page navigation
                    },
                  ),
                  const Divider(color: Colors.grey),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close drawer
              // TODO: Add proper logout navigation (e.g., to LoginPage)
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? Colors.blue.shade800,
        size: MediaQuery.of(context).size.width * 0.07,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.045,
          color: color ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      tileColor: Colors.transparent,
      hoverColor: Colors.blue.shade100.withOpacity(0.2),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int? _selectedButtonIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Greeting
            Container(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, User!",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Text(
                        "Stay Fit, Stay Healthy",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red.shade400,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            // Health Summary
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSummaryItem(context, "Steps", "5,432", Icons.directions_walk),
                    _buildSummaryItem(context, "Heart", "72 bpm", Icons.favorite),
                    _buildSummaryItem(context, "Sleep", "7h", Icons.nightlight_round),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            // Health Tracking
            Text(
              "Health Tracking",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
                    return GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
                      mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
                      childAspectRatio: 1.5,
                      children: [
                        _buildFeatureButton(context, "Heart Rate", Icons.favorite, 0),
                        _buildFeatureButton(context, "Step Counter", Icons.directions_walk, 1),
                        _buildFeatureButton(context, "Sleep Tracking", Icons.nightlight_round, 2),
                        _buildFeatureButton(context, "Calorie Tracker", Icons.local_dining, 3),
                        _buildFeatureButton(context, "Water Intake", Icons.local_drink, 4),
                        _buildFeatureButton(context, "Workout Time", Icons.fitness_center, 5),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            // Daily Tip Banner
            Card(
              elevation: 2,
              color: Colors.green.shade50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.green.shade600),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Expanded(
                      child: Text(
                        "Tip of the Day: Drink 8 glasses of water!",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.green.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            // Nearby Doctors
            Text(
              "Nearby Doctors",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            ..._buildDoctorCards(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 900) return 4;
    if (width > 600) return 3;
    return 2;
  }

  Widget _buildSummaryItem(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: MediaQuery.of(context).size.width * 0.06, color: Colors.blue.shade800),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.035,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureButton(BuildContext context, String label, IconData icon, int index) {
    bool isSelected = _selectedButtonIndex == index;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue.shade800 : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.blue.shade800,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: isSelected ? 6 : 2,
      ),
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: MediaQuery.of(context).size.width * 0.07,
            color: isSelected ? Colors.white : Colors.blue.shade800,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.008),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.blue.shade800,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDoctorCards() {
    final doctors = [
      {"name": "Dr. Smith", "specialty": "Cardiologist", "distance": "2.3 mi"},
      {"name": "Dr. Johnson", "specialty": "Dentist", "distance": "1.8 mi"},
      {"name": "Dr. Patel", "specialty": "Orthopedic", "distance": "3.5 mi"},
      {"name": "Dr. Lee", "specialty": "Neurologist", "distance": "2.1 mi"},
    ];

    return doctors
        .map((doctor) => DoctorCard(
      name: doctor["name"]!,
      specialty: doctor["specialty"]!,
      distance: doctor["distance"]!,
    ))
        .toList();
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String distance;

  const DoctorCard({super.key, required this.name, required this.specialty, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
      child: ListTile(
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.05,
          backgroundColor: Colors.blue.shade100,
          child: Icon(
            Icons.person,
            size: MediaQuery.of(context).size.width * 0.06,
            color: Colors.blue.shade800,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          "$specialty • $distance",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: Colors.grey.shade600,
          ),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
          child: Text(
            "Book",
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035),
          ),
        ),
      ),
    );
  }
}