import 'package:flutter/material.dart';

class ProjectHighlight extends StatelessWidget {
  final String? title;
  final String? description;
  final List<String>? technologies;

  const ProjectHighlight(
      {super.key, this.title, this.description, this.technologies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title!,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description!, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Technologies: ${technologies!.join(', ')}',
            style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
