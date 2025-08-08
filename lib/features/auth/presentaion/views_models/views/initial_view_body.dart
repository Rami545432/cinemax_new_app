import 'package:flutter/material.dart';
import '../widgets/initial_auth_first_section.dart';
import '../widgets/initial_auth_second_section.dart';

class InitialAuthViewBody extends StatelessWidget {
  const InitialAuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 2,
          child: InitialAuthFirstSection(),
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
          child: InitialAuthSecondSection(),
        ),
      ],
    );
  }
}
