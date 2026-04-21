import 'package:cinemax_app_new/core/notification/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationLabPage extends StatelessWidget {
  const NotificationLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final n = NotificationService.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Notification Lab')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Btn(
            title: "Alarm Usage",
            subtitle: "AudioAttributesUsage.alarm + strong vibration",
            onTap: n.testAlarmUsage,
          ),
          _Btn(
            title: "Normal / Media Usage",
            subtitle: "AudioAttributesUsage.media",
            onTap: n.testMediaUsage,
          ),
          _Btn(
            title: "Game Usage",
            subtitle: "AudioAttributesUsage.game",
            onTap: n.testGameUsage,
          ),
          _Btn(
            title: "Notification Event",
            subtitle: "AudioAttributesUsage.notificationEvent",
            onTap: n.testNotificationEventUsage,
          ),
          _Btn(
            title: "Assistant (Minimal)",
            subtitle: "AudioAttributesUsage.assistant + min importance",
            onTap: n.testAssistantUsage,
          ),
          _Btn(
            title: "Ringtone Usage",
            subtitle: "AudioAttributesUsage.notificationRingtone",
            onTap: n.testRingtoneUsage,
          ),
          _Btn(
            title: "Silent Channel",
            subtitle: "Importance.low + no sound/vibration",
            onTap: n.testSilentUsage,
          ),
          const SizedBox(height: 20),
          _Btn(
            title: "Clear All Notifications",
            subtitle: "Cancel all notifications",
            onTap: n.clearAllNotifications,
          ),
          _Btn(
            title: "TALABAT LIKE usage",
            subtitle: "Aggressive alerts with strong vibration + sound",
            onTap: n.testTalabatLikeUsage,
          ),
        ],
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      ),
      onPressed: () async {
        await onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        ],
      ),
    ),
  );
}
