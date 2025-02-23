import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Articles"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ArticleCard(
            title: "5 Ways to Improve Your Heart Health",
            content: "Maintaining a balanced diet, exercising regularly, reducing stress, and avoiding smoking can significantly improve heart health.",
          ),
          ArticleCard(
            title: "The Importance of Sleep for a Healthy Life",
            content: "Quality sleep is essential for physical and mental health. Aim for 7-9 hours of sleep per night to enhance recovery and well-being.",
          ),
          ArticleCard(
            title: "How to Maintain a Healthy Diet",
            content: "Eat a variety of vegetables, lean proteins, and whole grains. Avoid processed foods and sugary drinks for a balanced diet.",
          ),
          ArticleCard(
            title: "Tips to Reduce Stress and Anxiety",
            content: "Practicing mindfulness, deep breathing, and regular exercise can help manage stress and promote relaxation.",
          ),
          ArticleCard(
            title: "Hydration: Why Water is Key to Your Health",
            content: "Drinking enough water daily helps with digestion, skin health, and overall bodily functions. Aim for at least 8 glasses a day.",
          ),
          ArticleCard(
            title: "The Benefits of Regular Exercise",
            content: "Engaging in physical activity helps maintain weight, boosts mood, and strengthens the immune system.",
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
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(content, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
