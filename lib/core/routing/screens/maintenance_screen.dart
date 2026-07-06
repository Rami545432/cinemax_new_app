import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movify/core/remote_config/remote_config_service.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

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
              Icons.build_circle_outlined,
              size: 100,
              color: AppPrimaryColors.blueAccent,
            ),
            const SizedBox(height: 32),
            Text(
              'Under Maintenance',
              style: AppStyles.textStyle24(
                context,
              ).copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              RemoteConfigService.instance.maintenanceMessage,
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
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Close App',
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
