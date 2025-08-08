import 'package:flutter/material.dart';

class HorizentalSeprator extends StatelessWidget {
  const HorizentalSeprator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text(
        '___________',
        style: TextStyle(
          color: Color.fromARGB(255, 44, 44, 46),
        ),
      ),
    );
  }
}
