import 'dart:developer';

import 'package:flutter/material.dart';

class Perston {
  static String get name => 'bemo and bema';
  static String name4 = 'bemo and bema';
  static String _name3 = 'ali';
  String name2 = 'amir';
  final String namme = 'rami';

  Perston();
  static set name3(String name) {
    _name3 = name;
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Perston perston = Perston();
  Perston perston2 = Perston();

  @override
  Widget build(BuildContext context) {
    Perston.name;
    Perston.name4 = 'rami';
    Perston._name3 = 'rami';
    log((Perston._name3 == perston2.namme).toString());
    return Column(
      children: [
        Text((Perston.name == perston2.name2).toString()),
        Text(Perston.name),
        Text(Perston().name2),
        Text(Perston._name3),
      ],
    );
  }
}
