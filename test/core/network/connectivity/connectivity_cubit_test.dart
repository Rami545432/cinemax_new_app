import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/network/connectivity/connectivity_cubit.dart';

class MockConnectivity extends Mock implements Connectivity {}

class MockInternetConnection extends Mock implements InternetConnection {}

void main() {
  late MockConnectivity mockConnectivity;
  late MockInternetConnection mockInternetConnection;

  late StreamController<List<ConnectivityResult>> connectivityStreamController;
  late StreamController<InternetStatus> internetStreamController;

  setUp(() {
    mockConnectivity = MockConnectivity();
    mockInternetConnection = MockInternetConnection();

    connectivityStreamController =
        StreamController<List<ConnectivityResult>>.broadcast();
    internetStreamController = StreamController<InternetStatus>.broadcast();

    when(() => mockConnectivity.onConnectivityChanged)
        .thenAnswer((_) => connectivityStreamController.stream);

    when(() => mockInternetConnection.onStatusChange)
        .thenAnswer((_) => internetStreamController.stream);
  });

  tearDown(() {
    connectivityStreamController.close();
    internetStreamController.close();
  });

  group('ConnectivityCubit', () {
    blocTest<ConnectivityCubit, NetworkStatus>(
      'emits [connected] on initialization when internet is available',
      build: () {
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.wifi]);
        when(() => mockInternetConnection.hasInternetAccess)
            .thenAnswer((_) async => true);

        return ConnectivityCubit(
          connectivity: mockConnectivity,
          internetChecker: mockInternetConnection,
        );
      },
      expect: () => [NetworkStatus.connected],
    );

    blocTest<ConnectivityCubit, NetworkStatus>(
      'emits [disconnected] after debounce when internet access is false on init',
      build: () {
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.wifi]);
        when(() => mockInternetConnection.hasInternetAccess)
            .thenAnswer((_) async => false);

        return ConnectivityCubit(
          connectivity: mockConnectivity,
          internetChecker: mockInternetConnection,
        );
      },
      wait: const Duration(seconds: 3), // wait for 2s debounce
      expect: () => [NetworkStatus.disconnected],
    );

    blocTest<ConnectivityCubit, NetworkStatus>(
      'emits [disconnected] after debounce when connectivity stream emits [none]',
      build: () {
        // Init as online
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.wifi]);
        when(() => mockInternetConnection.hasInternetAccess)
            .thenAnswer((_) async => true);

        return ConnectivityCubit(
          connectivity: mockConnectivity,
          internetChecker: mockInternetConnection,
        );
      },
      act: (cubit) async {
        // Wait for init to finish
        await Future<void>.delayed(const Duration(milliseconds: 100));
        // Simulate network loss
        connectivityStreamController.add([ConnectivityResult.none]);
      },
      wait: const Duration(seconds: 3), // wait for 2s debounce
      skip: 1, // skip the initial [connected] state
      expect: () => [NetworkStatus.disconnected],
    );

    blocTest<ConnectivityCubit, NetworkStatus>(
      'emits [connected] immediately when internet stream emits connected',
      build: () {
        // Init as offline
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.none]);
        when(() => mockInternetConnection.hasInternetAccess)
            .thenAnswer((_) async => false);

        return ConnectivityCubit(
          connectivity: mockConnectivity,
          internetChecker: mockInternetConnection,
        );
      },
      act: (cubit) async {
        // Wait for init and debounce to finish
        await Future<void>.delayed(const Duration(seconds: 3));
        // Simulate internet restoration
        internetStreamController.add(InternetStatus.connected);
      },
      wait: const Duration(milliseconds: 100), // no debounce for connected
      skip: 1, // skip the initial [disconnected] state
      expect: () => [NetworkStatus.connected],
    );

    test('NetworkInfo interface getters reflect current state correctly', () async {
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      when(() => mockInternetConnection.hasInternetAccess)
          .thenAnswer((_) async => true);

      final cubit = ConnectivityCubit(
        connectivity: mockConnectivity,
        internetChecker: mockInternetConnection,
      );

      // Initially checking
      expect(cubit.isConnected, false);
      expect(cubit.isChecking, true);

      // Wait for async init
      await Future<void>.delayed(const Duration(milliseconds: 100));

      // Should be connected
      expect(cubit.isConnected, true);
      expect(cubit.isOnline, true);
      expect(cubit.isChecking, false);
      expect(cubit.isOffline, false);

      cubit.close();
    });
  });
}
