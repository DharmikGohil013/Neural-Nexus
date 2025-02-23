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
        children: List.generate(
          _articleList().length, // Ensures index stays within range
              (index) => _articleList()[index],
        ),
      ),
    );
  }

  List<ArticleCard> _articleList() {
    return [
      ArticleCard(title: "The Importance of Regular Exercise", summary: "Learn how regular exercise benefits your heart, mind, and body."),
      ArticleCard(title: "Healthy Eating Habits", summary: "Discover the best foods for optimal nutrition and a balanced diet."),
      ArticleCard(title: "Understanding Mental Health", summary: "The importance of mental well-being and how to maintain it."),
      ArticleCard(title: "The Science of Sleep", summary: "Why sleep is essential and tips to improve sleep quality."),
      ArticleCard(title: "Managing Stress Effectively", summary: "Techniques to reduce stress and enhance relaxation."),
      ArticleCard(title: "Hydration and Your Health", summary: "Why staying hydrated is crucial for overall well-being."),
      ArticleCard(title: "The Benefits of Meditation", summary: "How meditation can enhance focus, reduce stress, and improve health."),
      ArticleCard(title: "How to Boost Your Immune System", summary: "Natural ways to strengthen your immune defenses."),
      ArticleCard(title: "The Effects of Sugar on Your Body", summary: "Why excessive sugar intake can harm your health."),
      ArticleCard(title: "Yoga for a Healthy Lifestyle", summary: "Discover the benefits of yoga for flexibility, strength, and mental clarity."),
      ArticleCard(title: "Heart Disease Prevention Tips", summary: "Practical steps to maintain heart health."),
      ArticleCard(title: "How to Lower Blood Pressure Naturally", summary: "Lifestyle changes to help regulate blood pressure."),
      ArticleCard(title: "The Role of Gut Health in Overall Wellness", summary: "How gut bacteria affect digestion, immunity, and mental health."),
      ArticleCard(title: "The Benefits of Walking Daily", summary: "Why taking a daily walk is great for your health."),
      ArticleCard(title: "The Connection Between Diet and Mental Health", summary: "How the food you eat can impact mood and cognition."),
      ArticleCard(title: "Understanding and Managing Diabetes", summary: "Everything you need to know about diabetes care and prevention."),
      ArticleCard(title: "How to Improve Posture and Reduce Back Pain", summary: "Simple exercises and tips to maintain a healthy posture."),
      ArticleCard(title: "The Impact of Screen Time on Eye Health", summary: "Ways to reduce digital eye strain and protect vision."),
      ArticleCard(title: "Benefits of Strength Training", summary: "How lifting weights helps build muscle, burn fat, and boost metabolism."),
      ArticleCard(title: "Why Breakfast is the Most Important Meal of the Day", summary: "The importance of a nutritious breakfast for energy and focus."),
      ArticleCard(title: "How to Stay Motivated for Workouts", summary: "Tips to maintain fitness motivation and consistency."),
      ArticleCard(title: "The Importance of Sunlight for Vitamin D", summary: "How sun exposure affects bone health and immunity."),
      ArticleCard(title: "How to Reduce the Risk of Stroke", summary: "Preventive measures to protect brain health."),
      ArticleCard(title: "Understanding the Benefits of a Plant-Based Diet", summary: "How plant-based nutrition can improve overall health."),
      ArticleCard(title: "How Music Can Improve Your Health", summary: "The mental and physical benefits of listening to music."),
      ArticleCard(title: "Why Laughter is Good for Your Health", summary: "The science behind laughter and well-being."),
      ArticleCard(title: "How to Build Healthy Habits That Last", summary: "Techniques to form and maintain lifelong health habits."),
      ArticleCard(title: "The Power of Positive Thinking", summary: "How mindset influences physical and mental health."),
      ArticleCard(title: "The Role of Omega-3 in Brain Health", summary: "Why omega-3 fatty acids are essential for memory and cognition."),
      ArticleCard(title: "Intermittent Fasting: Benefits and Risks", summary: "Understanding how intermittent fasting affects metabolism."),
      ArticleCard(title: "The Link Between Exercise and Longevity", summary: "How regular physical activity extends lifespan."),
      ArticleCard(title: "Mental Exercises for a Sharper Brain", summary: "Cognitive exercises to enhance memory and focus."),
      ArticleCard(title: "How Processed Foods Impact Your Health", summary: "Why avoiding highly processed foods can improve your well-being."),
      ArticleCard(title: "The Dangers of Sitting Too Much", summary: "How a sedentary lifestyle affects your body and how to fix it."),
      ArticleCard(title: "The Benefits of Herbal Teas", summary: "How herbal teas support digestion, sleep, and relaxation."),
      ArticleCard(title: "Common Vitamin Deficiencies and How to Fix Them", summary: "Signs of vitamin deficiencies and the best food sources."),
      ArticleCard(title: "How Gratitude Improves Your Health", summary: "The science behind gratitude and emotional well-being."),
      ArticleCard(title: "The Importance of Social Connections for Mental Health", summary: "How relationships impact emotional stability and longevity."),
      ArticleCard(title: "How Deep Breathing Can Reduce Anxiety", summary: "Breathing techniques for stress relief and relaxation."),
      ArticleCard(title: "The Impact of Alcohol on Your Body", summary: "Understanding the effects of alcohol consumption on health."),
      ArticleCard(title: "The Importance of Regular Health Checkups", summary: "Why routine doctor visits are essential for prevention."),
      ArticleCard(title: "How Journaling Can Improve Mental Health", summary: "Benefits of writing down thoughts and emotions."),
    ];
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String summary;

  const ArticleCard({super.key, required this.title, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.article, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(summary),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
