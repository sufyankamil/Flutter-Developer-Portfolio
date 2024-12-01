import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesCertificationsScreen extends StatelessWidget {
  const CoursesCertificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> courses = [
      'Programming Basics',
      'Object-Oriented Programming',
      'Cisco NetAcad - ISTE National Level CODATHON-2020',
      'Certificate of Internship',
      'PCAP: Programming Essentials in Python',
      'Publication of Manuscript',
      'Certificate of Training Completion',
      'Version Control',
      'Introduction to iOS App Development with Swift',
      'Programming Fundamentals in Swift',
      'Principle of UI/UX Design',
    ];

    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Courses & Certifications',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            for (int i = 0; i < courses.length; i++) ...[
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    courses[i],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  trailing: const Icon(
                    FontAwesomeIcons.certificate,
                    color: Colors.deepPurple,
                  ),
                  subtitle: (i == 7 || i == 8 || i == 9 || i == 10)
                      ? GestureDetector(
                    onTap: () {
                      _launchURL(
                          i == 7
                              ? 'https://coursera.org/share/5ce6bf7dfc80915a2d6e4c94c31b40d0'
                              : i == 8
                              ? 'https://coursera.org/share/a7aae3a3f9ab2be87a52bcc90e91cbf3'
                              : i == 9
                              ? 'https://coursera.org/share/64e8cb82ab8eed8662ccfaff25a90cb2'
                              : 'https://coursera.org/share/e66717db2d37d279e70f250848f9d042');
                      // Dynamically load the URL based on the index
                    },
                    child: const Text(
                      'Show Certificate',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                      : null,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
