import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/network/connectivity/connectivity_cubit.dart';
import 'package:movify/core/network/connectivity/offline_banner.dart';
import 'package:movify/core/network/connectivity/online_banner.dart';

class NetworkStatusBanner extends StatefulWidget {
  const NetworkStatusBanner({super.key});

  @override
  State<NetworkStatusBanner> createState() => _NetworkStatusBannerState();
}

class _NetworkStatusBannerState extends State<NetworkStatusBanner> {
  Timer? _hideTimer;
  bool _showOnlineBanner = false;
  bool _wasOffline = false;

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: BlocConsumer<ConnectivityCubit, NetworkStatus>(
      listener: (context, connectivityState) {
        if (connectivityState == NetworkStatus.connected && _wasOffline) {
          _showOnlineBannerNow();
          _wasOffline = false;
        } else if (connectivityState == NetworkStatus.disconnected) {
          _hideTimer?.cancel();
          setState(() {
            _showOnlineBanner = false; // force hide online banner
          });
          _wasOffline = true;
        }
      },
      builder: (context, connectivityState) {
        final isOffline = connectivityState == NetworkStatus.disconnected;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            final slide =
                Tween<Offset>(
                  begin: const Offset(0, -1), // from top
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );

            return SlideTransition(
              position: slide,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: isOffline
              ? const OfflineBanner()
              : _showOnlineBanner
              ? const OnlineBanner()
              : const SizedBox.shrink(),
        );
      },
    ),
  );

  void _showOnlineBannerNow() {
    setState(() => _showOnlineBanner = true);

    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() => _showOnlineBanner = false);
      }
    });
  }
}
