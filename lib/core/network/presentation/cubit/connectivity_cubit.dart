// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum NetworkStatus { connected, disconnected, checking }

class ConnectivityCubit extends Cubit<NetworkStatus> {
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetChecker = InternetConnection.createInstance(
    customCheckOptions: [
      InternetCheckOption(uri: Uri.parse('https://google.com')),
      InternetCheckOption(uri: Uri.parse('https://example.com')),
    ],
  );

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  StreamSubscription<InternetStatus>? _internetSubscription;

  bool _hasConnection = true;
  DateTime _lastStatusChange = DateTime.now();

  ConnectivityCubit() : super(NetworkStatus.checking) {
    _initialize();
  }

  // 🚀 ENHANCED: Better initialization
  void _initialize() {
    log('🌐 ConnectivityCubit: Initializing...');

    // Listen to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
      onError: (error) {
        log('🌐 Connectivity error: $error');
        _updateStatus(false, 'Connectivity error: $error');
      },
    );

    // Listen to internet status changes
    _internetSubscription = _internetChecker.onStatusChange.listen(
      _onInternetStatusChanged,
      onError: (error) {
        log('🌐 Internet checker error: $error');
        _updateStatus(false, 'Internet checker error: $error');
      },
    );

    // Get initial status
    _checkInitialStatus();
  }

  Future<void> _checkInitialStatus() async {
    emit(NetworkStatus.checking);

    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      await _onConnectivityChanged(connectivityResult);
    } catch (e) {
      log('🌐 Initial status check failed: $e');
      _updateStatus(false, 'Initial check failed: $e');
    }
  }

  Future<void> _onConnectivityChanged(List<ConnectivityResult> results) async {
    log('🌐 Connectivity changed: $results');

    if (results.contains(ConnectivityResult.none)) {
      _updateStatus(false, 'No connection');
    } else {
      emit(NetworkStatus.checking);

      final hasInternet = await _internetChecker.hasInternetAccess;
      _updateStatus(
        hasInternet,
        hasInternet ? 'Connected' : 'No internet access',
      );
    }
  }

  void _onInternetStatusChanged(InternetStatus status) {
    log('🌐 Internet status changed: $status');

    final isConnected = status == InternetStatus.connected;
    _updateStatus(
      isConnected,
      isConnected ? 'Internet restored' : 'Internet lost',
    );
  }

  Timer? _offlineDebounceTimer;

  void _updateStatus(bool hasConnection, String reason) {
    if (_hasConnection != hasConnection || state == NetworkStatus.checking) {
      _hasConnection = hasConnection;
      _lastStatusChange = DateTime.now();

      log(
        '🌐 Status changed: ${hasConnection ? "CONNECTED" : "DISCONNECTED"} - $reason',
      );

      if (hasConnection) {
        _offlineDebounceTimer?.cancel();
        emit(NetworkStatus.connected);
      } else {
        // Debounce the disconnected state to prevent false offline flashes on app startup
        _offlineDebounceTimer?.cancel();
        _offlineDebounceTimer = Timer(const Duration(seconds: 2), () {
          if (!isClosed && !_hasConnection) {
            emit(NetworkStatus.disconnected);
          }
        });
      }
    }
  }

  bool get isOnline => state == NetworkStatus.connected;
  bool get isOffline => state == NetworkStatus.disconnected;
  bool get isChecking => state == NetworkStatus.checking;

  DateTime get lastStatusChange => _lastStatusChange;

  Future<void> checkStatus() async {
    emit(NetworkStatus.checking);
    await _checkInitialStatus();
  }

  @override
  Future<void> close() {
    log('🌐 ConnectivityCubit: Disposing...');
    _connectivitySubscription?.cancel();
    _internetSubscription?.cancel();
    _offlineDebounceTimer?.cancel();

    return super.close();
  }
}
