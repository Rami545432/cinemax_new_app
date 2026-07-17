import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movify/features/auth/presentation/widgets/login_tagline.dart';

void main() {
  testWidgets('LoginTagline has the correct text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: LoginTagline())),
    );
    expect(find.text('Sign to Save your favorite movies'), findsOneWidget);

    expect(find.text('And to Share your Reviews'), findsOneWidget);
  });
}
