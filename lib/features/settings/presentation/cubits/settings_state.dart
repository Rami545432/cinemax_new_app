import 'package:equatable/equatable.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsUnknown extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final bool isFirstTime;

  const SettingsLoaded({required this.isFirstTime});

  @override
  List<Object> get props => [isFirstTime];
}
