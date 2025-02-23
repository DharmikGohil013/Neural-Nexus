import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Articles'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ArticleCard(
            title: "The Importance of Hydration",
            content:
            "Water is essential for the body to function properly. Staying hydrated helps maintain energy levels, improves digestion, and flushes out toxins. Aim for at least 8 glasses of water daily.",
          ),
          ArticleCard(
            title: "Healthy Eating Habits",
            content:
            "A balanced diet includes proteins, carbohydrates, healthy fats, vitamins, and minerals. Eating fresh vegetables, fruits, whole grains, and lean meats boosts immunity and overall health.",
          ),
          ArticleCard(
            title: "Benefits of Regular Exercise",
            content:
            "Engaging in at least 30 minutes of physical activity daily improves heart health, builds muscle strength, and reduces stress. Activities like jogging, yoga, or strength training help maintain a healthy body.",
          ),
          ArticleCard(
            title: "Mental Health Matters",
            content:
            "Managing stress, getting enough sleep, and practicing mindfulness can enhance mental well-being. Engaging in hobbies and talking to loved ones also contribute to better emotional health.",
          ),
          ArticleCard(
            title: "How to Boost Immunity",
            content:
            "Consuming vitamin-rich foods, getting enough rest, and exercising regularly help strengthen the immune system. Avoiding excessive processed foods and stress also plays a crucial role in immunity.",
          ),
          ArticleCard(
            title: "Sleep and Its Impact on Health",
            content:
            "Quality sleep improves memory, boosts mood, and enhances overall health. Aim for at least 7-9 hours of sleep every night for optimal body and brain function.",
          ),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String content;

  const ArticleCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
