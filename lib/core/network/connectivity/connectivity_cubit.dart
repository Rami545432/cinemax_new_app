// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movify/core/network/client/network_info.dart';

/// Connectivity status exposed to the rest of the app.
enum NetworkStatus { connected, disconnected, checking }

/// Monitors device connectivity using both [Connectivity] (system
/// level) and [InternetConnection] (actual reachability check).
///
/// Also implements [NetworkInfo] so the data layer can depend on a
/// simple `bool get isConnected` without knowing about Cubit/Bloc.
class ConnectivityCubit extends Cubit<NetworkStatus> implements NetworkInfo {
  final Connectivity _connectivity;
  final InternetConnection _internetChecker;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  StreamSubscription<InternetStatus>? _internetSub;
  Timer? _offlineDebounceTimer;

  bool _hasConnection = true;
  DateTime _lastStatusChange = DateTime.now();

  ConnectivityCubit({
    Connectivity? connectivity,
    InternetConnection? internetChecker,
  }) : _connectivity = connectivity ?? Connectivity(),
       _internetChecker =
           internetChecker ??
           InternetConnection.createInstance(
             customCheckOptions: [
               InternetCheckOption(uri: Uri.parse('https://google.com')),
               InternetCheckOption(uri: Uri.parse('https://example.com')),
             ],
           ),
       super(NetworkStatus.checking) {
    _initialize();
  }

  // ── Initialization ──────────────────────────────────────────────────

  void _initialize() {
    _connectivitySub = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
      onError: (error) {
        _updateStatus(false, 'Connectivity error: $error');
      },
    );

    _internetSub = _internetChecker.onStatusChange.listen(
      _onInternetStatusChanged,
      onError: (error) {
        _updateStatus(false, 'Internet checker error: $error');
      },
    );

    _checkInitialStatus();
  }

  Future<void> _checkInitialStatus() async {
    emit(NetworkStatus.checking);
    try {
      final result = await _connectivity.checkConnectivity();
      await _onConnectivityChanged(result);
    } catch (e) {
      _updateStatus(false, 'Initial check failed: $e');
    }
  }

  // ── Event handlers ──────────────────────────────────────────────────

  Future<void> _onConnectivityChanged(List<ConnectivityResult> results) async {
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
    final online = status == InternetStatus.connected;
    _updateStatus(online, online ? 'Internet restored' : 'Internet lost');
  }

  // ── Status management ───────────────────────────────────────────────

  void _updateStatus(bool hasConnection, String reason) {
    if (_hasConnection != hasConnection || state == NetworkStatus.checking) {
      _hasConnection = hasConnection;
      _lastStatusChange = DateTime.now();

      if (hasConnection) {
        _offlineDebounceTimer?.cancel();
        emit(NetworkStatus.connected);
      } else {
        // Debounce disconnection to prevent false offline flashes
        // during app startup.
        _offlineDebounceTimer?.cancel();
        _offlineDebounceTimer = Timer(const Duration(seconds: 2), () {
          if (!isClosed && !_hasConnection) {
            emit(NetworkStatus.disconnected);
          }
        });
      }
    }
  }

  // ── Public API ──────────────────────────────────────────────────────

  /// [NetworkInfo] implementation — used by the data layer.
  @override
  bool get isConnected => state == NetworkStatus.connected;

  bool get isOnline => state == NetworkStatus.connected;
  bool get isOffline => state == NetworkStatus.disconnected;
  bool get isChecking => state == NetworkStatus.checking;

  DateTime get lastStatusChange => _lastStatusChange;

  /// Force a re-check of connectivity status.
  Future<void> checkStatus() async {
    emit(NetworkStatus.checking);
    await _checkInitialStatus();
  }

  // ── Lifecycle ───────────────────────────────────────────────────────

  @override
  Future<void> close() {
    _connectivitySub?.cancel();
    _internetSub?.cancel();
    _offlineDebounceTimer?.cancel();
    return super.close();
  }
}
