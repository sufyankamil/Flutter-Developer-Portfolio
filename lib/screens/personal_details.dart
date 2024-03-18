import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const DetailCard(
            icon: Icons.person,
            title: 'Sufyan  Kamil',
          ),
          DetailCard(
            icon: FontAwesomeIcons.linkedin,
            title: 'LinkedIn Profile',
            onTap: () =>
                _launchURL('https://www.linkedin.com/in/sufyan-k-77a974110/'),
          ),
          DetailCard(
            icon: FontAwesomeIcons.github,
            title: 'Github Profile',
            onTap: () => _launchURL('https://github.com/sufyankamil'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class DetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const DetailCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
