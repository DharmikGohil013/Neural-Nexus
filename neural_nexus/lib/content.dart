import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health & Wellness"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Latest Health Articles",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildArticleCard(
              context,
              "The Benefits of Daily Exercise",
              "Exercise improves overall health, boosts immunity, and reduces stress.",
              "https://www.healthline.com/nutrition/10-benefits-of-exercise",
            ),
            _buildArticleCard(
              context,
              "Top 10 Superfoods for a Healthy Diet",
              "Discover the best superfoods to improve your nutrition and well-being.",
              "https://www.medicalnewstoday.com/articles/what-are-superfoods",
            ),
            _buildArticleCard(
              context,
              "How to Improve Your Sleep Naturally",
              "Effective strategies to enhance sleep quality without medication.",
              "https://www.sleepfoundation.org/sleep-hygiene",
            ),
            _buildArticleCard(
              context,
              "Hydration and Its Impact on Your Health",
              "Learn why drinking enough water is crucial for your body.",
              "https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/water/art-20044256",
            ),
            const SizedBox(height: 20),
            const Text(
              "Health & Fitness Videos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildVideoCard(
              context,
              "Full Body Workout for Beginners",
              "https://www.youtube.com/watch?v=UBMk30rjy0o",
            ),
            _buildVideoCard(
              context,
              "Healthy Eating Tips",
              "https://www.youtube.com/watch?v=oIsPqja-M2I",
            ),
            _buildVideoCard(
              context,
              "5 Tips for Better Sleep",
              "https://www.youtube.com/watch?v=fnI3VbZ0tR0",
            ),
            _buildVideoCard(
              context,
              "Yoga for Stress Relief",
              "https://www.youtube.com/watch?v=v7AYKMP6rOE",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context, String title, String description, String url) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.article),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () async {
          Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, String title, String videoUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.video_library),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.play_arrow),
        onTap: () async {
          Uri uri = Uri.parse(videoUrl);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      ),
    );
  }
}
