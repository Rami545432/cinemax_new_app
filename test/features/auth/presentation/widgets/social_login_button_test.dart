import 'package:cinemax_app_new/features/auth/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Rather than test(), we use testWidgets() to simulate rendering UI!
  testWidgets('SocialLoginButton renders title and responds to taps', (
    tester,
  ) async {
    // 1. ARRANGE: Create a "Spy" variable to listen for our tap
    bool wasTapped = false;

    // 2. ACT (Mount): Build the widget inside a fake testing environment
    // We must wrap it in MaterialApp and Scaffold so it can inherit Theme data!
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SocialLoginButton(
            icon: 'assets/icons/google.svg', // Passed a fake icon path
            title: 'Google',
            onTap: () {
              wasTapped = true; // This will trigger if the button works
            },
          ),
        ),
      ),
    );

    // 3. ASSERT: Check if the UI rendered correctly
    // We expect to find exactly ONE Text widget that says 'Continue with Google'
    expect(find.text('Continue with Google'), findsOneWidget);

    // 4. ACT (Interact): Simulate a real human tapping on the button
    await tester.tap(find.byType(SocialLoginButton));

    // We ALWAYS 'pump' after a tap to give Flutter time to process animations and states!
    await tester.pump();

    // 5. ASSERT: Did our spy variable update? If yes, the button works!
    expect(wasTapped, true);
  });
}
