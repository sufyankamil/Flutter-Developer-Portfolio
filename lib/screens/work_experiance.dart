import 'package:flutter/material.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Work Experience',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      body: ListView(
        children: const <Widget>[
          ExperienceTile(
            company: 'Lauren Information Technologies Pvt. Ltd.',
            position: 'Flutter Developer',
            duration: 'July 2023 - Present',
            responsibilities: [
              'Leading the development of client-specific applications using FlutterFlow',
              'Engaging with clients to understand requirements and translating those needs into effective FlutterFlow solutions',
              'Collaborating with developers, designers, and project managers to deliver cohesive and efficient applications',
              'Staying updated with the latest FlutterFlow updates to incorporate advanced functionalities',
              'Identifying and addressing issues in the development process, optimizing applications for performance and user experience',
              'Maintaining clear documentation of development processes and reporting on project progress',
            ],
          ),
          SizedBox(height: 10),
          ExperienceTile(
            company: 'Headstrait Software LLP',
            position: 'Full Stack Developer',
            duration: 'Jan 2022 - Apr 2023',
            responsibilities: [
              'Worked with a fast-paced small team',
              'Developed and maintained full-stack web applications',
              'Worked closely with the design team',
              'Designed and implemented RESTful APIs',
              'Utilized test-driven development methodologies',
              'Conducted regular code reviews',
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String company;

  final String position;
  final String duration;
  final List<String> responsibilities;

  const ExperienceTile({
    super.key,
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        leading: const Icon(Icons.work_outline, color: Colors.blue),
        title: Text('$position at $company',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(duration),
        children: responsibilities
            .map((responsibility) => ListTile(
                  title: Text(responsibility),
                  leading: const Icon(Icons.check_circle_outline,
                      color: Colors.green),
                ))
            .toList(),
      ),
    );
  }
}
