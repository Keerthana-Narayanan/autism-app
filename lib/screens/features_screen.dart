import 'package:flutter/material.dart';
import 'speech_to_text_screen.dart';
import '../widgets/feature_card.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Features')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          FeatureCard(title: 'Communication Tools', description: 'Enhance speech and text-based interactions.'),
          FeatureCard(title: 'Emotional Regulation', description: 'Interactive tools to manage emotions.'),
          FeatureCard(title: 'Learning Modules', description: 'Educational and developmental activities.'),
          FeatureCard(title: 'Parent & Caregiver Portal', description: 'Track progress and manage settings.'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpeechToTextScreen()));
            },
            child: Text('Speech to Text Feature'),
          ),
        ],
      ),
    );
  }
}
