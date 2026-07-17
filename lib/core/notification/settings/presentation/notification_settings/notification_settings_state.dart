part of 'notification_settings_cubit.dart';

abstract class NotificationSettingsState {}

class NotificationSettingsInitial extends NotificationSettingsState {}

class NotificationSettingsLoading extends NotificationSettingsState {}

class NotificationSettingsLoaded extends NotificationSettingsState {
  final bool isEnabled;

  NotificationSettingsLoaded({required this.isEnabled});
}
