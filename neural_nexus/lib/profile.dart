import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';// Importing Main Page for Logout Navigation

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue.shade800, // Consistent with home.dart
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              _buildProfileAvatar(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              _buildProfileInfo(context, 'Name', 'John Doe', Icons.person),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              _buildProfileInfo(context, 'Email', 'johndoe@example.com', Icons.email),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              _buildProfileInfo(context, 'Phone', '+1 234 567 890', Icons.phone),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              _buildEditProfileButton(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              _buildLogoutButton(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.15, // Responsive radius
      backgroundImage: const AssetImage('assets/images/user.png'), // Add your profile image
    );
  }

  Widget _buildProfileInfo(BuildContext context, String label, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade800, size: MediaQuery.of(context).size.width * 0.07),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.045,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
      ),
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement Edit Profile Feature
      },
      icon: Icon(Icons.edit, size: MediaQuery.of(context).size.width * 0.06),
      label: Text(
        'Edit Profile',
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015,
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
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
      icon: Icon(
        Icons.logout,
        color: Colors.red,
        size: MediaQuery.of(context).size.width * 0.06,
      ),
      label: Text(
        'Logout',
        style: TextStyle(
          color: Colors.red,
          fontSize: MediaQuery.of(context).size.width * 0.045,
        ),
      ),
    );
  }
}