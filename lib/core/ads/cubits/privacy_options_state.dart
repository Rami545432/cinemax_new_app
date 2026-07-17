// lib/features/settings/cubit/privacy_options_state.dart

import 'package:equatable/equatable.dart';

enum PrivacyOptionsStatus { initial, loading, completed, failure }

class PrivacyOptionsState extends Equatable {
  final PrivacyOptionsStatus status;
  final String? errorMessage;

  const PrivacyOptionsState._({required this.status, this.errorMessage});

  const factory PrivacyOptionsState.initial() = _Initial;
  const factory PrivacyOptionsState.loading() = _Loading;
  const factory PrivacyOptionsState.completed() = _Completed;
  const factory PrivacyOptionsState.failure(String message) = _Failure;

  @override
  List<Object?> get props => [status, errorMessage];
}

class _Initial extends PrivacyOptionsState {
  const _Initial() : super._(status: PrivacyOptionsStatus.initial);
}

class _Loading extends PrivacyOptionsState {
  const _Loading() : super._(status: PrivacyOptionsStatus.loading);
}

class _Completed extends PrivacyOptionsState {
  const _Completed() : super._(status: PrivacyOptionsStatus.completed);
}

class _Failure extends PrivacyOptionsState {
  const _Failure(String message)
    : super._(status: PrivacyOptionsStatus.failure, errorMessage: message);
}
