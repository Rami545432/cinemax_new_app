import 'package:flutter/material.dart';

import '../../../../../core/utils/primary_texts.dart';

class SignUpViewBodyFirstSection extends StatelessWidget {
  const SignUpViewBodyFirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        PrimaryTexts(
          title: "Let’s get started",
          subtitle: 'The latest movies and series are here',
        ),
      ],
    );
  }
}
