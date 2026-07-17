import 'package:flutter/material.dart';
import 'package:movify/features/onboarding/presentation/widgets/call_to_action_button.dart';
import 'package:movify/features/onboarding/presentation/widgets/progress_dot.dart';

class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.totalCount,
    required this.buttonText,
    required this.onNext,
    this.onSkip,
  });

  final Widget child;
  final int currentIndex;
  final int totalCount;
  final String buttonText;
  final VoidCallback onNext;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                Expanded(child: child),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, bottomPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProgressDot(
                        currentIndex: currentIndex,
                        totalCount: totalCount,
                      ),
                      const SizedBox(height: 20),
                      CallToActionButton(
                        buttonTitle: buttonText,
                        onPressed: onNext,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
