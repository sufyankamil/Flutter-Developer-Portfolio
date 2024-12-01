import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Work Experience',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
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
            ExperienceTile(
              company: 'Hasbasoft Technology Private Limited',
              position: 'Trainee Full Stack Developer',
              duration: 'Sept 2021 - Jan 2022',
              responsibilities: [
                'Participated in training program for full stack development',
                'Assisted in the development of web applications',
                'Learned and applied full stack development technologies and methodologies',
                'Worked under the guidance of senior developers',
                'Contributed to team projects and collaborated with colleagues',
              ],
            ),
            ExperienceTile(
              company: 'LetsGrowMore',
              position: 'Web Development Intern',
              duration: 'Aug 2021 - Sep 2021',
              responsibilities: [
                'Participated in web development projects under supervision',
                'Contributed to the design and implementation of web applications',
                'Learned and applied various web development technologies and frameworks',
                'Assisted in debugging and troubleshooting issues in existing projects',
              ],
            ),
            ExperienceTile(
              company: 'The Sparks Foundation',
              position: 'Web Development Intern',
              duration: 'Jun 2021 - July 2021',
              accomplishments: 'Ranked among the top interns',
              responsibilities: [
                'Engaged in web development projects and tasks',
                'Acquired practical experience in front-end and back-end development',
                'Collaborated with team members to achieve project goals',
                'Demonstrated strong performance and dedication during the internship',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;
  final String? accomplishments;

  const ExperienceTile({
    super.key,
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
    this.accomplishments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
        },
        child: ExpansionTile(
          leading: const Icon(Icons.work_outline, color: Colors.deepPurple),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$position at $company',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              if (accomplishments != null)
                Text(
                  accomplishments!,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          subtitle: Text(
            duration,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          children: responsibilities
              .map((responsibility) => ListTile(
            title: Text(
              responsibility,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            leading: const Icon(Icons.check_circle_outline,
                color: Colors.green),
          ))
              .toList(),
        ),
      ),
    );
  }
}
