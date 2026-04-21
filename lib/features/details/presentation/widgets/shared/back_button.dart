import 'package:flutter/material.dart';

class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back_ios_new_rounded),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}
