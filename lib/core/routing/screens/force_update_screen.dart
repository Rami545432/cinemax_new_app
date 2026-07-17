import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  Future<void> _openStore() async {
    // In a real app, replace with your actual store URLs
    final url = Platform.isAndroid
        ? 'https://play.google.com/store/apps/details?id=com.yourcompany.cinemax'
        : 'https://apps.apple.com/app/id123456789';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppPrimaryColors.dark,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.system_update,
              size: 100,
              color: AppPrimaryColors.blueAccent,
            ),
            const SizedBox(height: 32),
            Text(
              'Update Required',
              style: AppStyles.textStyle24(
                context,
              ).copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'A new version of the app is available. Please update to continue using the app.',
              style: AppStyles.textStyle16(
                context,
              ).copyWith(color: Colors.grey.shade200),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPrimaryColors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _openStore,
                child: Text(
                  'Update Now',
                  style: AppStyles.textStyle16(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
