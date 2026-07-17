// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/notification/fcm_token_manger.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();
  late FcmTokenManager _tokenManager;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();

  // Counter to generate unique notification IDs
  int _notificationId = 0;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'Used for important notifications.',
    importance: Importance.max,
  );

  Future<void> init() async {
    try {
      // 1) permissions (Removed: We now handle this via the Profile Settings switch)
      // We no longer ask immediately on app launch to improve UX.

      // 2) local notification init
      await _initLocalNotifications();

      // 3) configure FCM handlers
      await _initFCMListeners();
      _tokenManager = FcmTokenManager(
        messaging: FirebaseMessaging.instance,
        firestore: FirebaseFirestore.instance,
        uidProvider: () {
          final sessionCubit = getIt<SessionCubit>();
          final state = sessionCubit.state;

          if (state is SessionAuthenticated) {
            return state.user.uid;
          }
          return null;
        },
        resubscribeTopics: () async {
          // later: genres list from Hive
        },
      );

      await _tokenManager.init();

      // 4) get token and listen for refresh
      await _initFCMToken();
    } catch (e) {}
  }

  Future<void> _initLocalNotifications() async {
    // Android settings
    const android = AndroidInitializationSettings(
      '@drawable/ic_launcher_monochrome',
    );

    // iOS settings
    const ios = DarwinInitializationSettings();

    const initSettings = InitializationSettings(android: android, iOS: ios);

    await _local.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (resp) {
        final payload = resp.payload;
        if (payload != null) {
          // _handleNotificationClick(payload);
        }
      },
    );

    // Create Android notification channel
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);
  }

  Future<void> _initFCMToken() async {
    // Get current token
    // final token = await _fcm.getToken();

    // Listen for token refresh
    _fcm.onTokenRefresh.listen((newToken) {});
  }

  Future<void> _initFCMListeners() async {
    // Foreground: show local notification manually
    FirebaseMessaging.onMessage.listen((message) {
      _showForegroundNotification(message);
    });

    // Tapped when app was in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // _handleFCMClick(message.data);
    });

    // Tapped when app was terminated
    final initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      // _handleFCMClick(initialMessage.data);
    }
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) {
      return;
    }

    final dataPayload = jsonEncode(message.data);

    // Android details
    final androidDetails = AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@drawable/ic_launcher_monochrome',
    );

    // iOS details
    const iosDetails = DarwinNotificationDetails(sound: 'default');

    // Use unique ID for each notification
    final id = _notificationId++;

    await _local.show(
      id: id,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
      payload: dataPayload,
    );
  }

  // void _handleFCMClick(Map<String, dynamic> data) {
  //   final payload = jsonEncode(data);
  //   _handleNotificationClick(payload);
  // }

  // void _handleNotificationClick(String payload) {
  //   try {
  //     final data = jsonDecode(payload);

  //     final type = data['type'];
  //     final id = data['id'];

  //     // TODO: Navigate based on type
  //     // Example:
  //     // if (type == 'message') navigateToChat(id);
  //     // if (type == 'order') navigateToOrder(id);
  //   } catch (e) {}
  // }

  Future<void> onUserAuthenticated() async {
    await _tokenManager.syncToken();
    // await _resubscribeTopics(); // (genres later)
  }

  Future<void> onUserLoggedOutOrGuest() async {
    await _tokenManager.logoutCleanup();
  }

  Future<void> createTestChannels() async {
    const alarmChannel = AndroidNotificationChannel(
      'test_alarm_channel',
      'Test Alarm Channel',
      description: 'Alarm usage test channel',
      importance: Importance.max,
      audioAttributesUsage: AudioAttributesUsage.alarm,
    );

    const mediaChannel = AndroidNotificationChannel(
      'test_media_channel',
      'Test Media Channel',
      description: 'Media usage test channel',
      importance: Importance.high,
      audioAttributesUsage: AudioAttributesUsage.media,
    );

    const silentChannel = AndroidNotificationChannel(
      'test_silent_channel',
      'Test Silent Channel',
      description: 'Silent updates channel',
      importance: Importance.low,
      playSound: false,
      enableVibration: false,
    );

    const gameChannel = AndroidNotificationChannel(
      'test_game_channel',
      'Test Game Channel',
      description: 'Game usage test channel',
      importance: Importance.high,
      audioAttributesUsage: AudioAttributesUsage.game,
    );

    const notificationEventChannel = AndroidNotificationChannel(
      'test_notification_event_channel',
      'Test Notification Event Channel',
      description: 'Notification event usage test channel',
      importance: Importance.max,
      audioAttributesUsage: AudioAttributesUsage.notificationEvent,
    );

    const assistantChannel = AndroidNotificationChannel(
      'test_assistant_channel',
      'Test Assistant Channel',
      description: 'Assistant usage test channel',
      importance: Importance.min,
      audioAttributesUsage: AudioAttributesUsage.assistant,
    );

    const ringtoneChannel = AndroidNotificationChannel(
      'test_ringtone_channel',
      'Test Ringtone Channel',
      description: 'Notification ringtone usage test channel',
      importance: Importance.high,
      audioAttributesUsage: AudioAttributesUsage.notificationRingtone,
    );
    const AndroidNotificationChannel talabatLikeChannel =
        AndroidNotificationChannel(
          'talabat_like_channel',
          'Urgent Alerts',
          description: 'Aggressive alerts with strong vibration + sound',
          importance: Importance.max,
        );

    final androidPlugin = _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(alarmChannel);
    await androidPlugin?.createNotificationChannel(mediaChannel);
    await androidPlugin?.createNotificationChannel(silentChannel);
    await androidPlugin?.createNotificationChannel(gameChannel);
    await androidPlugin?.createNotificationChannel(notificationEventChannel);
    await androidPlugin?.createNotificationChannel(assistantChannel);
    await androidPlugin?.createNotificationChannel(ringtoneChannel);
    await androidPlugin?.createNotificationChannel(talabatLikeChannel);
  }

  Future<void> _showTest({
    required int id,
    required String channelId,
    required String channelName,
    required String title,
    required String body,
    Importance importance = Importance.high,
    Priority priority = Priority.high,
    bool playSound = true,
    bool enableVibration = true,
    Int64List? vibrationPattern,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: importance,
      priority: priority,
      playSound: playSound,
      enableVibration: enableVibration,
      vibrationPattern: vibrationPattern,
    );

    await _local.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(android: androidDetails),
    );
  }

  Future<void> testAlarmUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2001,
      channelId: 'test_alarm_channel',
      channelName: 'Test Alarm Channel',
      title: 'ALARM usage',
      body: 'AudioAttributesUsage.alarm',
      importance: Importance.max,
      vibrationPattern: Int64List.fromList([0, 500, 150, 500]),
    );
  }

  Future<void> testMediaUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2002,
      channelId: 'test_media_channel',
      channelName: 'Test Media Channel',
      title: 'MEDIA usage',
      body: 'AudioAttributesUsage.media',
    );
  }

  Future<void> testGameUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2003,
      channelId: 'test_game_channel',
      channelName: 'Test Game Channel',
      title: 'GAME usage',
      body: 'AudioAttributesUsage.game',
    );
  }

  Future<void> testNotificationEventUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2004,
      channelId: 'test_notification_event_channel',
      channelName: 'Test Notification Event Channel',
      title: 'NOTIFICATION EVENT usage',
      body: 'AudioAttributesUsage.notificationEvent',
      importance: Importance.max,
    );
  }

  Future<void> testAssistantUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2005,
      channelId: 'test_assistant_channel',
      channelName: 'Test Assistant Channel',
      title: 'ASSISTANT usage',
      body: 'AudioAttributesUsage.assistant (min importance)',
      importance: Importance.min,
      priority: Priority.min,
      playSound: false,
      enableVibration: false,
    );
  }

  Future<void> testRingtoneUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2006,
      channelId: 'test_ringtone_channel',
      channelName: 'Test Ringtone Channel',
      title: 'RINGTONE usage',
      body: 'AudioAttributesUsage.notificationRingtone',
    );
  }

  Future<void> testSilentUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2007,
      channelId: 'test_silent_channel',
      channelName: 'Test Silent Channel',
      title: 'SILENT',
      body: 'No vibration, no sound',
      importance: Importance.low,
      priority: Priority.low,
      playSound: false,
      enableVibration: false,
    );
  }

  Future<void> testTalabatLikeUsage() async {
    await createTestChannels();
    await _showTest(
      id: 2008,
      channelId: 'test_talabat_like_channel',
      channelName: 'Test Talabat Like Channel',
      title: 'TALABAT LIKE usage',
      body: 'Aggressive alerts with strong vibration + sound',
      importance: Importance.max,
    );
  }

  Future<void> clearAllNotifications() async {
    await _local.cancelAll();
  }
}
