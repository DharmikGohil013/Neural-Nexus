import 'package:flutter/material.dart';
import 'main.dart'; // Importing Main Page for Logout Navigation

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildProfileAvatar(),
            const SizedBox(height: 20),
            _buildProfileInfo('Name', 'John Doe', Icons.person),
            _buildProfileInfo('Email', 'johndoe@example.com', Icons.email),
            _buildProfileInfo('Phone', '+1 234 567 890', Icons.phone),
            const SizedBox(height: 30),
            _buildEditProfileButton(context),
            const SizedBox(height: 20),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('assets/images/user.png'), // Add your profile image
    );
  }

  Widget _buildProfileInfo(String label, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement Edit Profile Feature
      },
      icon: const Icon(Icons.edit),
      label: const Text('Edit Profile'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      icon: const Icon(Icons.logout, color: Colors.red),
      label: const Text('Logout', style: TextStyle(color: Colors.red, fontSize: 16)),
    );
  }
}
