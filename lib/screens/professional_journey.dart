import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class ProfessionalJourney extends StatelessWidget {
  const ProfessionalJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Professional Journey',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                FadeInUp(
                  preferences: const AnimationPreferences(
                      duration: Duration(seconds: 1)),
                  child: professionalJourney(),
                ),
              ],
            ),
          ),
        ));
  }

  Widget professionalJourney() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Started as a Full Stack Developer, my journey has been a blend of diverse technologies and challenges. I`ve embraced various roles and responsibilities, evolving into a Senior Flutter Developer with a passion for creating intuitive and impactful mobile applications.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 20),
        TimelineTile('Full Stack Developer',
            'Started my career, focusing on web technologies.'),
        TimelineTile('Transition to Mobile Development',
            'Shifted focus to mobile app development.'),
        TimelineTile('Senior Flutter Developer',
            'Currently leading Flutter projects, specializing in mobile app development.'),
      ],
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String title;
  final String description;

  const TimelineTile(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          const Icon(Icons.timeline, size: 30, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
