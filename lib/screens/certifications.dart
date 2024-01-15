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
        title: const Text(
          'Courses & Certifications',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(courses[0]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[1]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[2]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[3]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[4]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[5]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[6]),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[7]),
            subtitle: GestureDetector(
              onTap: () {
                _launchURL(
                    'https://coursera.org/share/5ce6bf7dfc80915a2d6e4c94c31b40d0');
              },
              child: const Text('Show Certificate'),
            ),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[8]),
            subtitle: GestureDetector(
              onTap: () {
                _launchURL(
                    'https://coursera.org/share/a7aae3a3f9ab2be87a52bcc90e91cbf3');
              },
              child: const Text('Show Certificate'),
            ),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[9]),
            subtitle: GestureDetector(
              onTap: () {
                _launchURL(
                    'https://coursera.org/share/64e8cb82ab8eed8662ccfaff25a90cb2');
              },
              child: const Text('Show Certificate'),
            ),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
          ListTile(
            title: Text(courses[10]),
            subtitle: GestureDetector(
              onTap: () {
                _launchURL(
                    'https://coursera.org/share/e66717db2d37d279e70f250848f9d042');
              },
              child: const Text('Show Certificate'),
            ),
            trailing: const Icon(FontAwesomeIcons.certificate),
          ),
        ],
      ),
    );
  }
}
