import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:movify/constants/assets.dart';
import 'package:movify/core/animations/animated_button.dart';
import 'package:movify/core/network/connectivity/connectivity_cubit.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';

class RetryButton extends HookWidget {
  const RetryButton({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final isTryAgain = useState(false);

    return BlocConsumer<ConnectivityCubit, NetworkStatus>(
      listener: (context, state) {
        if (state == NetworkStatus.connected) {
          isTryAgain.value = true;
          onRetry?.call();
        }
        if (state == NetworkStatus.disconnected) {
          isTryAgain.value = false;
        }
      },
      builder: (context, state) => Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            spacing: 40,
            children: [
              Lottie.asset(Assets.imagesNoInternet),
              const Center(child: Text('No internet connection')),
              AnimatedButton(
                onPressed: () {
                  onRetry?.call();
                },
                entranceAnimation: ButtonAnimationType.scale,
                pressAnimation: ButtonAnimationType.press,
                animationDuration: const Duration(seconds: 1),
                entranceDelay: const Duration(seconds: 1),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppPrimaryColors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: Center(
                      child: isTryAgain.value
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Retry',
                              style: AppStyles.textStyle16(context),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
