import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/screens/certifications.dart';
import 'package:portfolio/screens/feedback.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/work_experiance.dart';

import 'personal_details.dart';
import 'professional_journey.dart';
import 'section_title.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late CollectionReference _visitCountCollection;

  @override
  void initState() {
    super.initState();
    // Initialize the Firestore collection reference
    _visitCountCollection =
        FirebaseFirestore.instance.collection('visit_count');
    _incrementVisitCount(); // Increment the visit count when the page loads
  }

  void _incrementVisitCount() async {
    DocumentSnapshot snapshot = await _visitCountCollection.doc('count').get();
    int currentCount = snapshot.exists
        ? (snapshot.data() as Map<String, dynamic>)['count'] ?? 0
        : 0;
    _visitCountCollection.doc('count').set({'count': currentCount + 1});

   Fluttertoast.showToast(
      msg: 'Welcome! You are visitor number ${currentCount + 1}. '
          'Welcome to my portfolio! I\'m thrilled you\'re here. '
          'As you explore, feel free to reach out if you have any questions or would like to connect. '
          'Thanks for stopping by!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );

  }

  void navigateToProfessionalJourney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfessionalJourney(),
      ),
    );
  }

  void navigateToProject() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProjectsScreen(),
      ),
    );
  }

  void navigateToCertifications() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CoursesCertificationsScreen(),
      ),
    );
  }

  void navigateToWorkExperience() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WorkExperienceScreen(),
      ),
    );
  }

  void navigateToPersonalDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PersonalDetailsScreen(),
      ),
    );
  }

  void navigateToFeedback() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FeedbackScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  nameIconWIdget(),
                  SizedBox(height: 10),
                  nameWidget(),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.work_outline),
              title: const Text('Professional Journey'),
              onTap: () {
                Navigator.pop(context);
                navigateToProfessionalJourney();
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Projects'),
              onTap: () {
                Navigator.pop(context);
                navigateToProject();
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Courses & Certifications'),
              onTap: () {
                Navigator.pop(context);
                navigateToCertifications();
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Work Experience'),
              onTap: () {
                Navigator.pop(context);
                navigateToWorkExperience();
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Personal Details'),
              onTap: () {
                Navigator.pop(context);
                navigateToPersonalDetails();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.pop(context);
                navigateToFeedback();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              FadeInUp(
                preferences:
                    const AnimationPreferences(duration: Duration(seconds: 1)),
                child: selfImage(),
              ),
              const SizedBox(height: 10),
              FadeInLeft(child: const SectionTitle('Hello, I am')),
              FadeInRight(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 1100),
                ),
                child: selfName(),
              ),
              const SizedBox(height: 10),
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 1200),
                ),
                child: professionalTitle(),
              ),
              StreamBuilder(
                stream: _visitCountCollection.doc('count').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }

                  return Container();
                },
              ),
              const SizedBox(height: 20),
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 1300),
                ),
                child: keySkills(),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                preferences: const AnimationPreferences(
                  duration: Duration(milliseconds: 1400),
                ),
                child: aboutMe(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutMe() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle('About Me'),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'I am a Flutter Developer with a passion for creating intuitive and impactful mobile applications. I have 2+ years of experience in developing mobile applications using Flutter and Dart. I have worked on various projects ranging from small to large scale applications. I have also worked on various technologies like NodeJS, MongoDB, ExpressJS, HTML, CSS, JavaScript, Python, etc.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget keySkills() {
    List<String> skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'NodeJS',
      'MongoDB',
      'ExpressJS',
      'HTML',
      'CSS',
      'JavaScript',
      'Python',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SectionTitle('Key Skills'),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map((skill) => Chip(
                      label: Text(skill),
                      backgroundColor: Colors.deepPurple,
                      labelStyle: const TextStyle(color: Colors.white),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Text selfName() {
    return const Text(
      'Sufyan Kamil',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  CircleAvatar selfImage() {
    return const CircleAvatar(
      radius: 50.0,
      child: Text('SK',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
    );
  }

  Text professionalTitle() {
    return const Text(
      'Flutter Developer',
      style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
    );
  }
}

class nameIconWIdget extends StatelessWidget {
  const nameIconWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50.0,
      child: Text('SK',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
    );
  }
}

class nameWidget extends StatelessWidget {
  const nameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: const Text(
        'Mohd Sufyan Asghar Kamil',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        softWrap: true,
      ),
    );
  }
}
