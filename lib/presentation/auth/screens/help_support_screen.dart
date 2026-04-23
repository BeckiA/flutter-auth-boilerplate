import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: ListView(
        children: [
          const _SupportSection(
            title: 'Frequently Asked Questions',
            children: [
              _ExpandableFAQ(
                question: 'How do I track my workouts?',
                answer:
                    'To track your workouts, go to the home screen and tap the "+" button. Fill in your workout details and save.',
              ),
              _ExpandableFAQ(
                question: 'How do I view my progress?',
                answer:
                    'Your progress is displayed on the home screen through the calendar graph. Each colored cell represents a workout day.',
              ),
              _ExpandableFAQ(
                question: 'Can I edit my profile?',
                answer:
                    'Yes! Go to Profile tab and tap "Edit Profile" to update your information.',
              ),
            ],
          ),
          const Divider(),
          _SupportSection(
            title: 'Contact Support',
            children: [
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: const Text('Email Support'),
                subtitle: const Text('support@fitnesstracker.com'),
                onTap: () {
                  // TODO: Implement email support
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat_outlined),
                title: const Text('Live Chat'),
                subtitle: const Text('Chat with our support team'),
                onTap: () {
                  // TODO: Implement live chat
                },
              ),
            ],
          ),
          const Divider(),
          _SupportSection(
            title: 'Resources',
            children: [
              ListTile(
                leading: const Icon(Icons.book_outlined),
                title: const Text('User Guide'),
                onTap: () {
                  // TODO: Implement user guide
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library_outlined),
                title: const Text('Video Tutorials'),
                onTap: () {
                  // TODO: Implement video tutorials
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SupportSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SupportSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        ...children,
      ],
    );
  }
}

class _ExpandableFAQ extends StatelessWidget {
  final String question;
  final String answer;

  const _ExpandableFAQ({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
      ],
    );
  }
}
