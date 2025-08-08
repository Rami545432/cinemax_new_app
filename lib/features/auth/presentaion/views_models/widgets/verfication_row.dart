import 'package:flutter/material.dart';

import 'verfication_text_fields.dart';

class VerficationRow extends StatelessWidget {
  const VerficationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VerficationTextField(),
        VerficationTextField(),
        VerficationTextField(),
        VerficationTextField(),
      ],
    );
  }
}
