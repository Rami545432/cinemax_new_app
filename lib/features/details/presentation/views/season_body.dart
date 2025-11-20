import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../widgets/season/season_body_content.dart';

class SeasonBody extends HookWidget {
  const SeasonBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SeasonBodyContent();
  }
}
