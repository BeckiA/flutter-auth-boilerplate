import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutReminder = useState(true);
    final weeklyProgress = useState(true);
    final pushNotifications = useState(true);
    final emailNotifications = useState(false);

    useEffect(() {
      // Load notification preferences
      SharedPreferences.getInstance().then((prefs) {
        workoutReminder.value = prefs.getBool('workoutReminder') ?? true;
        weeklyProgress.value = prefs.getBool('weeklyProgress') ?? true;
        pushNotifications.value = prefs.getBool('pushNotifications') ?? true;
        emailNotifications.value = prefs.getBool('emailNotifications') ?? false;
      });
      return null;
    }, []);

    Future<void> saveNotificationPreference(String key, bool value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: [
          _NotificationSection(
            title: 'Workout Reminders',
            children: [
              _NotificationTile(
                title: 'Daily Workout Reminder',
                subtitle: 'Remind me to workout daily',
                value: workoutReminder.value,
                onChanged: (value) {
                  workoutReminder.value = value;
                  saveNotificationPreference('workoutReminder', value);
                },
              ),
              _NotificationTile(
                title: 'Weekly Progress Report',
                subtitle: 'Send me weekly progress updates',
                value: weeklyProgress.value,
                onChanged: (value) {
                  weeklyProgress.value = value;
                  saveNotificationPreference('weeklyProgress', value);
                },
              ),
            ],
          ),
          _NotificationSection(
            title: 'System Notifications',
            children: [
              _NotificationTile(
                title: 'Push Notifications',
                subtitle: 'Enable push notifications',
                value: pushNotifications.value,
                onChanged: (value) {
                  pushNotifications.value = value;
                  saveNotificationPreference('pushNotifications', value);
                },
              ),
              _NotificationTile(
                title: 'Email Notifications',
                subtitle: 'Receive email notifications',
                value: emailNotifications.value,
                onChanged: (value) {
                  emailNotifications.value = value;
                  saveNotificationPreference('emailNotifications', value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotificationSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _NotificationSection({
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

class _NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
