import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/certifications.dart';
import 'package:portfolio/screens/feedback.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/work_experiance.dart';
import 'package:url_launcher/url_launcher.dart';

import 'professional_journey.dart';
import 'section_title.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late CollectionReference _visitCountCollection;

  final Color primaryColor = const Color(0xFF6A1B9A); // Deep Purple
  final Color secondaryColor = const Color(0xFFCE93D8); // Light Purple

  @override
  void initState() {
    super.initState();
    _visitCountCollection =
        FirebaseFirestore.instance.collection('visit_count');
    _incrementVisitCount();
  }

  void _incrementVisitCount() async {
    DocumentSnapshot snapshot = await _visitCountCollection.doc('count').get();
    int currentCount = snapshot.exists
        ? (snapshot.data() as Map<String, dynamic>)['count'] ?? 0
        : 0;
    _visitCountCollection.doc('count').set({'count': currentCount + 1});

    Fluttertoast.showToast(
      msg: 'Welcome! You are visitor number ${currentCount + 1}. '
          'Feel free to explore my portfolio!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: primaryColor,
      webBgColor: "linear-gradient(to right, #6A19BA, #CE93D8)",
      textColor: Colors.white,
    );
  }

  void navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            'Code & Craft',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ensure text is readable on gradient
            ),
          ),
          backgroundColor:
          Colors.transparent, // Set to transparent for gradient
          elevation: 0, // Optional: removes shadow for a cleaner look
          actions: screenWidth >= 1000
              ? _buildAppBarActions() // Show options in AppBar for wide screens
              : [], // Empty list to remove actions if screen is narrow
        ),
      ),
      endDrawer: screenWidth < 1000
          ? Drawer(
        child: Container(
          color: primaryColor,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, secondaryColor],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text(
                        'SK',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Mohd Sufyan Kamil',
                      style: GoogleFonts.lora(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ..._buildDrawerItems(),
            ],
          ),
        ),
      )
          : null, // Don't show drawer on larger screens
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                FadeInUp(child: selfImage()),
                const SizedBox(height: 10),
                FadeInRight(
                  child: Text(
                    'Hi, I am',
                    style: GoogleFonts.lora(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                FadeInLeft(
                  child: selfName(),
                ),
                const SizedBox(height: 10),
                FadeInUp(
                  child: professionalTitle(),
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  child: aboutMeCard(),
                ),
                const SizedBox(height: 30),
                FadeInUp(
                  child: keySkillsCard(),
                ),
                const SizedBox(height: 30),
                hobbies(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: contactMe(),
    );
  }

  List<ListTile> _buildDrawerItems() {
    return [
      ListTile(
        leading: const Icon(Icons.work_outline, color: Colors.white),
        title: const Text('Professional Journey', style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          navigateToScreen(const ProfessionalJourney());
        },
      ),
      ListTile(
        leading: const Icon(Icons.code, color: Colors.white),
        title: const Text('Projects', style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          navigateToScreen(const ProjectsScreen());
        },
      ),
      ListTile(
        leading: const Icon(Icons.school, color: Colors.white),
        title: const Text('Courses & Certifications', style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          navigateToScreen(const CoursesCertificationsScreen());
        },
      ),
      ListTile(
        leading: const Icon(Icons.work, color: Colors.white),
        title: const Text('Work Experience', style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          navigateToScreen(const WorkExperienceScreen());
        },
      ),
      ListTile(
        leading: const Icon(Icons.feedback, color: Colors.white),
        title: const Text('Feedback', style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          navigateToScreen(const FeedbackScreen());
        },
      ),
    ];
  }

  List<Widget> _buildAppBarActions() {
    return [
      TextButton(
        onPressed: () {
          navigateToScreen(const ProfessionalJourney());
        },
        child: const Text(
          'Professional Journey',
          style: TextStyle(color: Colors.white),
        ),
      ),
      TextButton(
        onPressed: () {
          navigateToScreen(const ProjectsScreen());
        },
        child: const Text(
          'Projects',
          style: TextStyle(color: Colors.white),
        ),
      ),
      TextButton(
        onPressed: () {
          navigateToScreen(const CoursesCertificationsScreen());
        },
        child: const Text(
          'Courses & Certifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      TextButton(
        onPressed: () {
          navigateToScreen(const WorkExperienceScreen());
        },
        child: const Text(
          'Work Experience',
          style: TextStyle(color: Colors.white),
        ),
      ),
      TextButton(
        onPressed: () {
          navigateToScreen(const FeedbackScreen());
        },
        child: const Text(
          'Feedback',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ];
  }

  Widget aboutMeCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: aboutMe(),
      ),
    );
  }

  Widget keySkillsCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: keySkills(),
      ),
    );
  }

  Widget aboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('About Me'),
        const SizedBox(height: 10),
        Text(
          'I am a Flutter Developer with 3 years of experience in building mobile applications. '
              'I specialize in creating clean, user-friendly, and impactful designs.',
          style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey[800]),
        ),
      ],
    );
  }

  Widget keySkills() {
    List<String> skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'UI/UX Design',
      'Git & GitHub',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Key Skills'),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: skills
              .map((skill) => Chip(
            label: Text(skill),
            backgroundColor: primaryColor,
            labelStyle: const TextStyle(color: Colors.white),
          ))
              .toList(),
        ),
      ],
    );
  }

  Widget hobbies() {
    return FadeInUp(
      child: Card(
        elevation: 4, // Adds shadow for a lifted effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle('Hobbies'),
              const SizedBox(height: 10),
              Text(
                'When I am not coding, you can find me exploring new tech trends, traveling, and learning new skills.',
                style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selfImage() {
    return FadeInUp(
      child: CircleAvatar(
        radius: 50.0,
        backgroundColor: primaryColor,
        child: const Text('SK',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Widget selfName() {
    return Text(
      'Mohd Sufyan Kamil',
      style: GoogleFonts.roboto(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget professionalTitle() {
    return Text(
      'Flutter Developer',
      style: GoogleFonts.lora(fontSize: 20, color: Colors.white),
    );
  }

  Widget contactMe() {
    return FloatingActionButton(
      onPressed: () async {
        const String subject = 'Hello';

        const String body = 'I would like to get in touch!';

        final Uri _emailLaunchUri = Uri(
          scheme: 'mailto',
          path: 'sufyankamil15@gmail.com',
          queryParameters: {
            'subject': subject,
            'body': body,
          },
        );

        if (await canLaunchUrl(_emailLaunchUri)) {
          await launchUrl(_emailLaunchUri);
        } else {
          _showErrorDialog();
        }
      },
      backgroundColor: Colors.deepPurple,
      child: const Icon(Icons.email, color: Colors.white),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not open the email client. Please check your email configuration.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
