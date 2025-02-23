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
            // ... (Keep existing article sections)

            const SizedBox(height: 20),
            const Text(
              "Health & Fitness Shorts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildReelsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildReelsSection() {
    final List<Map<String, String>> reels = [
      {
        'title': 'Full Body Workout',
        'url': 'https://www.youtube.com/watch?v=UBMk30rjy0o',
        'duration': '0:30'
      },
      {
        'title': 'Healthy Eating Tips',
        'url': 'https://www.youtube.com/watch?v=oIsPqja-M2I',
        'duration': '0:45'
      },
    ];

    return SizedBox(
      height: 220, // Adjust based on your needs
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return _buildReelCard(
            context,
            reels[index]['title']!,
            reels[index]['url']!,
            reels[index]['duration']!,
          );
        },
      ),
    );
  }

  Widget _buildReelCard(BuildContext context, String title, String url, String duration) {
    return Container(
      width: 120, // Card width
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: GestureDetector(
        onTap: () async {
          Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: Stack(
          children: [
            // Add actual video thumbnail here
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey, // Placeholder color
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Center(
              child: Icon(
                Icons.play_circle_filled,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 12,
              left: 8,
              right: 8,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

// Keep existing _buildArticleCard and other methods
}