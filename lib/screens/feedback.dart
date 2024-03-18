import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _feedbackController.dispose();
  }

  void _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with saving feedback
      String name = _nameController.text;
      String email = _emailController.text;
      String feedback = _feedbackController.text;

      try {
        // Save feedback data to Firestore
        await FirebaseFirestore.instance.collection('feedback').add({
          'name': name,
          'email': email,
          'feedback': feedback,
          'timestamp': Timestamp.now(),
        });

        // Clear text fields after submission
        _nameController.clear();
        _emailController.clear();
        _feedbackController.clear();

        Fluttertoast.showToast(
          msg: 'Feedback submitted successfully!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.pop(context);
      } catch (error) {
        Fluttertoast.showToast(
          msg: 'Failed to submit feedback. Please try again later.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email ID';
                  }
                  // Check if the entered email is valid
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _feedbackController,
                decoration: const InputDecoration(
                  labelText: 'Feedback/Comment',
                  alignLabelWithHint: true,
                  hintText: 'Enter your feedback or comment here',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submitFeedback();
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
