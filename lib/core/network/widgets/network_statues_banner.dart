import 'dart:async';
import 'dart:developer';

import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/cubit/connectivity_cubit.dart';

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
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: BlocConsumer<ConnectivityCubit, NetworkStatus>(
        listener: (context, connectivityState) {
          if (connectivityState == NetworkStatus.connected && _wasOffline) {
            log('🌐 📶 BACK ONLINE! Showing banner...');
            _showOnlineBannerNow();
            _wasOffline = false;
          } else if (connectivityState == NetworkStatus.disconnected) {
            log('🌐 📵 OFFLINE! Showing banner...');
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
                ? _buildOfflineBanner()
                : _showOnlineBanner
                ? _buildOnlineBanner()
                : const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  void _showOnlineBannerNow() {
    setState(() => _showOnlineBanner = true);

    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) {
        log('🌐 ✅ Hiding online banner');
        setState(() => _showOnlineBanner = false);
      }
    });
  }

  Widget _buildOnlineBanner() {
    return _BannerBase(
      color: Colors.green.shade700,
      icon: Icons.wifi,
      text: 'Back Online',
    );
  }

  Widget _buildOfflineBanner() {
    return _BannerBase(
      color: Colors.red.shade700,
      icon: Icons.wifi_off_rounded,
      text: 'No internet connection',
    );
  }
}

class _BannerBase extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  const _BannerBase({
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppStyles.textStyle18(
                context,
              ).copyWith(color: Colors.white, decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
