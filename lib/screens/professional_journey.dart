import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class ProfessionalJourney extends StatelessWidget {
  const ProfessionalJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Professional Journey',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF6A1B9A),  // Deep Purple
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(seconds: 1),
                ),
                child: professionalJourney(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget professionalJourney() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Started as a Full Stack Developer, my journey has been a blend of diverse technologies and challenges. I\'ve embraced various roles and responsibilities, evolving into a Senior Flutter Developer with a passion for creating intuitive and impactful mobile applications.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          TimelineTile(
             'Full Stack Developer',
             'Started my career, focusing on web technologies.',
          ),
          TimelineTile(
             'Transition to Mobile Development',
             'Shifted focus to mobile app development.',
          ),
          TimelineTile(
             'Senior Flutter Developer',
             'Currently leading Flutter projects, specializing in mobile app development.',
          ),
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String title;
  final String description;

  const TimelineTile(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: const Color(0xFF6A1B9A),  // Purple shadow
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            const Icon(Icons.timeline, size: 30, color: Color(0xFF6A1B9A)),  // Purple color for icon
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),  // Title color
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}